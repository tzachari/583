#include "llvm/IR/Module.h"
#include "llvm/Pass.h"
#include "llvm/Analysis/Passes.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/ADT/IndexedMap.h"
#include <map>
#include <sys/stat.h>
#include "llvm/Support/raw_ostream.h"
#include "llvm/Analysis/ProfileInfo.h"
#include "LAMP/LAMPLoadProfile.h"
#include "LAMP/LAMPProfiling.h"

using namespace llvm;

namespace {
  struct hw1pass2: public ModulePass {
    static char ID;
    LAMPLoadProfile *LLP;
    ProfileInfo *PI;
    hw1pass2() : ModulePass(ID) {}
    virtual bool runOnModule(Module &M) {
      LLP = &getAnalysis<LAMPLoadProfile>();
      PI = &getAnalysis<ProfileInfo>();
      std::map<unsigned int, Instruction*> InstructionMap = LLP->IdToInstMap; // Inst* -> InstId
      std::map<Instruction*, unsigned int> InstructionID = LLP->InstToIdMap; // InstID -> Inst*
      std::map<std::pair<Instruction*, Instruction*>*, unsigned int> dependenceMap = LLP->DepToTimesMap;
      std::map<unsigned int, float> dependenceFrac;  
 
      errs() << "LoadID\tDependenceFraction\n";
      for (std::map<std::pair<Instruction*, Instruction*>*, unsigned int>::iterator I = dependenceMap.begin(), E = dependenceMap.end(); I != E; I++) {
          Instruction *InstrA = I->first->first, *InstrB = I->first->second;
          if (isa<StoreInst>(InstrA)) dependenceFrac[InstructionID[InstrA]] += ((bool)isa<StoreInst>(InstrB))*(I->second) / (PI->getExecutionCount(InstrA->getParent()));
      }
      for (std::map<unsigned int, float>::iterator I = dependenceFrac.begin(), E = dependenceFrac.end(); I != E; I++) errs() << format("%ld\t%5f\n",I->first,I->second);
      return false;
    }
    void getAnalysisUsage(AnalysisUsage &AU) const {
      AU.addRequired<LAMPLoadProfile>();
      AU.addRequired<ProfileInfo>();
    }
  };
}

char hw1pass2::ID = 0;
static RegisterPass<hw1pass2> C("hw1pass2", "Memory Profiling Pass", false, false);

