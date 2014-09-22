#include "llvm/IR/Module.h"
#include "llvm/Pass.h"
#include "llvm/Analysis/Passes.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/Support/Debug.h"
#include "llvm/IR/DataLayout.h" //#include "llvm/Target/TargetData.h"
#include "llvm/ADT/IndexedMap.h"
#include <map>
#include <sstream>
#include <fstream>
#include <iostream>
#include <string>
#include <sys/stat.h>
#include "llvm/Support/raw_ostream.h"
#include "llvm/Analysis/ProfileInfo.h"
#include "LAMP/LAMPLoadProfile.h"
#include "LAMP/LAMPProfiling.h"

using namespace llvm;

namespace {
  struct hw1pass2: public FunctionPass {
    static char ID;
    LAMPLoadProfile *LLP;
    hw1pass2() : FunctionPass(ID) {}
    virtual bool runOnFunction(Function &F) {
      LLP = &getAnalysis<LAMPLoadProfile>();
//      std::map<std::pair<Instruction*, Instruction*>*, unsigned int> dynamicDepMap = LLP->DepToTimesMap;
//      std::map<BasicBlock*, std::set<std::pair<Instruction*, Instruction*>* > > LoopToDep = LLP->LoopToDepSetMap;
      std::map<unsigned int, Instruction*> InstructionMap = LLP->IdToInstMap; // Inst* -> InstId
      std::map<Instruction*, unsigned int> InstructionID = LLP->InstToIdMap; // InstID -> Inst*
      std::map<std::pair<Instruction*, Instruction*>*, unsigned int> dependenceMap = LLP->DepToTimesMap;
    
      errs() << "*********************************************\n";
      errs() << "************* LAMP information **************\n";
      errs() << "*********************************************\n";
      errs() << "LoadID\tDependenceFraction\n";
      for (std::map<std::pair<Instruction*, Instruction*>*, unsigned int>::iterator I = dependenceMap.begin(), E = dependenceMap.end(); I != E; I++) {
          Instruction *InstrA = I->first->first, *InstrB = I->first->second;
          if (isa<LoadInst>(InstrA) && isa<StoreInst>(InstrB)) {
              LoadInst *Load = dyn_cast<LoadInst>(InstrA);
              StoreInst *Store = dyn_cast<StoreInst>(InstrB);
              if (Load && Store) errs() << InstructionID[InstrA] << "\t" << (I->second) * 1.0 << "\n";
          }
      }
   
      return false;
    }
    void getAnalysisUsage(AnalysisUsage &AU) const {
      AU.addRequired<LAMPLoadProfile>();
    }
  };
//  struct statComp: public FunctionPass {
//    static char ID;
//    ProfileInfo* PI;
//    statComp() : FunctionPass(ID) {
//      errs() << "FuncName  \t      DynOpCount\t           %IALU\t           %FALU\t            %MEM\t  %Biased-BRANCH\t%Unbiased-BRANCH\t          %OTHER\n";
//    }
//    virtual bool runOnFunction(Function &F) {
//      PI = &getAnalysis<ProfileInfo>();
//      float ops=0, ial=0, fal=0, mem=0, bbr=0, ubr=0, otr=0;
//      for(Function::iterator b = F.begin(), be = F.end(); b != be; ++b) {
//        int bra=0;
//        for(BasicBlock::iterator i = b->begin(), ie = b->end(); i != ie; i++) {
//          int code = i->getOpcode();
//          ops+=(PI->getExecutionCount(b));
//	  if (code==8 || code==10 || code==12 || (code>13 & code<16) || (code>16 & code<19) || (code>19 & code<26) || (code>32 & code<36) || (code>41 & code<46)) ial+=(PI->getExecutionCount(b));
//          else if (code==9 || code==11 || code==13 || code==16 || code==19 || (code>35 & code<42) || code==46) fal+=(PI->getExecutionCount(b));
//          else if (code>25 & code<33) mem+=(PI->getExecutionCount(b));
//          else if (code>1 && code<5) bra+=(PI->getExecutionCount(b));
//          else otr+=(PI->getExecutionCount(b));
//        }
//        ubr+=bra;
//	for(Function::iterator c = F.begin(), ce = F.end(); c != ce; ++c) {
//          if (bra && PI->getEdgeWeight(PI->getEdge(b,c))/bra > .8) { bbr+=bra; ubr-=bra;}
//        }
//      }
//      errs() << format("%-10s\t%16d\t%15.1f%%\t%15.1f%%",F.getName().data(),(int)ops,ial/ops*100,fal/ops*100) << format("\t%15.1f%%\t%15.1f%%\t%15.1f%%\t%15.1f%%\n",mem/ops*100,bbr/ops*100,ubr/ops*100,otr/ops*100);
//      return false; //return true if you modified the code
//    }
//    void getAnalysisUsage(AnalysisUsage &AU) const {
//      AU.addRequired<ProfileInfo>();
//    }   
//  };
}

char hw1pass2::ID = 0;
static RegisterPass<hw1pass2> C("hw1pass2", "Memory Profiling Pass", false, false);

//char statComp::ID = 0;
//static RegisterPass<statComp> X("statComp", "Statistics Computation Pass", false, false);
