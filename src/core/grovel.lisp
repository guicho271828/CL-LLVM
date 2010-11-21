(in-package :llvm)

(cc-flags "-D__STDC_LIMIT_MACROS"
          "-D__STDC_CONSTANT_MACROS")
(include "llvm-c/Core.h")

(cenum opcode
       ((:ret "LLVMRet"))
       ((:br "LLVMBr"))
       ((:switch "LLVMSwitch"))
       ((:indirect-br "LLVMIndirectBr"))
       ((:invoke "LLVMInvoke"))
       ((:unwind "LLVMUnwind"))
       ((:unreachable "LLVMUnreachable"))
       ((:add "LLVMAdd"))
       ((:f-add "LLVMFAdd"))
       ((:sub "LLVMSub"))
       ((:f-sub "LLVMFSub"))
       ((:mul "LLVMMul"))
       ((:f-mul "LLVMFMul"))
       ((:u-div "LLVMUDiv"))
       ((:s-div "LLVMSDiv"))
       ((:f-div "LLVMFDiv"))
       ((:u-rem "LLVMURem"))
       ((:s-rem "LLVMSRem"))
       ((:f-rem "LLVMFRem"))
       ((:shl "LLVMShl"))
       ((:shr "LLVMLShr"))
       ((:a-shr "LLVMAShr"))
       ((:and "LLVMAnd"))
       ((:or "LLVMOr"))
       ((:xor "LLVMXor"))
       ((:alloca "LLVMAlloca"))
       ((:load "LLVMLoad"))
       ((:store "LLVMStore"))
       ((:get-element-ptr "LLVMGetElementPtr"))
       ((:trunc "LLVMTrunc"))
       ((:z-ext "LLVMZExt"))
       ((:s-ext "LLVMSExt"))
       ((:fp-to-ui "LLVMFPToUI"))
       ((:fp-to-si "LLVMFPToSI"))
       ((:ui-to-fp "LLVMUIToFP"))
       ((:si-to-fp "LLVMSIToFP"))
       ((:fp-trunc "LLVMFPTrunc"))
       ((:fp-ext "LLVMFPExt"))
       ((:ptr-to-int "LLVMPtrToInt"))
       ((:int-to-ptr "LLVMIntToPtr"))
       ((:bit-cast "LLVMBitCast"))
       ((:i-cmp "LLVMICmp"))
       ((:f-cmp "LLVMFCmp"))
       ((:phi "LLVMPHI"))
       ((:call "LLVMCall"))
       ((:select "LLVMSelect"))
       ((:va-arg "LLVMVAArg"))
       ((:extract-element "LLVMExtractElement"))
       ((:insert-element "LLVMInsertElement"))
       ((:shuffle-vector "LLVMShuffleVector"))
       ((:extract-value "LLVMExtractValue"))
       ((:insert-value "LLVMInsertValue")))

(cenum type-kind
       ((:void "LLVMVoidTypeKind"))
       ((:float "LLVMFloatTypeKind"))
       ((:double "LLVMDoubleTypeKind"))
       ((:x86-fp80 "LLVMX86_FP80TypeKind"))
       ((:fp128 "LLVMFP128TypeKind"))
       ((:ppc-fp128 "LLVMPPC_FP128TypeKind"))
       ((:label "LLVMLabelTypeKind"))
       ((:integer "LLVMIntegerTypeKind"))
       ((:function "LLVMFunctionTypeKind"))
       ((:struct "LLVMStructTypeKind"))
       ((:array "LLVMArrayTypeKind"))
       ((:pointer "LLVMPointerTypeKind"))
       ((:opaque "LLVMOpaqueTypeKind"))
       ((:vector "LLVMVectorTypeKind"))
       ((:metadata "LLVMMetadataTypeKind")))

(cenum linkage
       ((:external "LLVMExternalLinkage"))
       ((:available-externally "LLVMAvailableExternallyLinkage"))
       ((:link-once-any "LLVMLinkOnceAnyLinkage"))
       ((:link-once-odr "LLVMLinkOnceODRLinkage"))
       ((:weak-any "LLVMWeakAnyLinkage"))
       ((:weak-odr "LLVMWeakODRLinkage"))
       ((:appending "LLVMAppendingLinkage"))
       ((:internal "LLVMInternalLinkage"))
       ((:private "LLVMPrivateLinkage"))
       ((:dll-import "LLVMDLLImportLinkage"))
       ((:dll-export "LLVMDLLExportLinkage"))
       ((:external-weak "LLVMExternalWeakLinkage"))
       ((:ghost "LLVMGhostLinkage"))
       ((:common "LLVMCommonLinkage"))
       ((:linker-private "LLVMLinkerPrivateLinkage")))

(cenum visibility
       ((:default "LLVMDefaultVisibility"))
       ((:hidden "LLVMHiddenVisibility"))
       ((:protected "LLVMProtectedVisibility")))

(cenum calling-convention
       ((:c "LLVMCCallConv"))
       ((:fast "LLVMFastCallConv"))
       ((:cold "LLVMColdCallConv"))
       ((:x86-stdcall "LLVMX86StdcallCallConv"))
       ((:x86-fastcall "LLVMX86FastcallCallConv")))

(cenum int-predicate
       ((:= "LLVMIntEQ"))
       ((:/= "LLVMIntNE"))
       ((:unsigned-> "LLVMIntUGT"))
       ((:unsigned->= "LLVMIntUGE"))
       ((:unsigned-< "LLVMIntULT"))
       ((:unsigned-<= "LLVMIntULE"))
       ((:> "LLVMIntSGT"))
       ((:>= "LLVMIntSGE"))
       ((:< "LLVMIntSLT"))
       ((:<= "LLVMIntSLE")))

(cenum real-predicate
       ((:false "LLVMRealPredicateFalse"))
       ((:= "LLVMRealOEQ"))
       ((:> "LLVMRealOGT"))
       ((:>= "LLVMRealOGE"))
       ((:< "LLVMRealOLT"))
       ((:<= "LLVMRealOLE"))
       ((:/= "LLVMRealONE"))
       ((:ordered "LLVMRealORD"))
       ((:unordered "LLVMRealUNO"))
       ((:unordered-= "LLVMRealUEQ"))
       ((:unordered-> "LLVMRealUGT"))
       ((:unordered->= "LLVMRealUGE"))
       ((:unordered-< "LLVMRealULT"))
       ((:unordered-<= "LLVMRealULE"))
       ((:unordered-/= "LLVMRealUNE"))
       ((:true "LLVMRealPredicateTrue")))
