#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Analysis/ProfileInfo.h"
//#include "LAMP/LAMPLoadProfile.h"
//#include "LAMP/LAMPProfiling.h"

#define NUMBER_OF_OPS 70

using namespace llvm;

namespace {
  struct hw1pass1: public FunctionPass {
    static char ID;
    ProfileInfo* PI;
    hw1pass1() : FunctionPass(ID) {
      errs() << "FuncName  \t      DynOpCount\t           %IALU\t           %FALU\t            %MEM\t  %Biased-BRANCH\t%Unbiased-BRANCH\t          %OTHER\n";
    }
    virtual bool runOnFunction(Function &F) {
      PI = &getAnalysis<ProfileInfo>();
      float ops=0, ial=0, fal=0, mem=0, bbr=0, ubr=0, otr=0;
      for(Function::iterator b = F.begin(), be = F.end(); b != be; ++b) {
        int bra=0;
        for(BasicBlock::iterator i = b->begin(), ie = b->end(); i != ie; i++) {
          int code = i->getOpcode();
          int upcount = (PI->getExecutionCount(b) < 0) ? 0 : PI->getExecutionCount(b);
          ops+=upcount;
	  if (code==8 || code==10 || code==12 || (code>13 & code<16) || (code>16 & code<19) || (code>19 & code<26) || (code>32 & code<36) || (code>41 & code<46)) ial+=(upcount);
          else if (code==9 || code==11 || code==13 || code==16 || code==19 || (code>35 & code<42) || code==46) fal+=(upcount);
          else if (code>25 & code<33) mem+=(upcount);
          else if (code>1 && code<5) bra+=(upcount);
          else otr+=(upcount);
        }
        ubr+=bra;
	for(Function::iterator c = F.begin(), ce = F.end(); c != ce; ++c) {
          if (bra && PI->getEdgeWeight(PI->getEdge(b,c))/bra > .8) { bbr+=bra; ubr-=bra;}
        }
      }
      errs() << format("%-10s\t%16d\t%15.1f%%\t%15.1f%%",F.getName().data(),(int)ops,ial/ops*100,fal/ops*100) << format("\t%15.1f%%\t%15.1f%%\t%15.1f%%\t%15.1f%%\n",mem/ops*100,bbr/ops*100,ubr/ops*100,otr/ops*100);
      return false; //return true if you modified the code
    }
    void getAnalysisUsage(AnalysisUsage &AU) const {
      AU.addRequired<ProfileInfo>();
    }   
  };
}

char hw1pass1::ID = 0;
static RegisterPass<hw1pass1> C("hw1pass1", "Statistics Computation Pass", false, false);
