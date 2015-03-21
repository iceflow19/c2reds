Red/System []

#include %common.reds
#define LIBCLANG "/usr/lib/llvm-3.5/lib/libclang-3.5.so"

_clang: context [

	#enum CXErrorCode! [
		CXError_Success: 0
		CXError_Failure: 1
		CXError_Crashed: 2
		CXError_InvalidArguments: 3
		CXError_ASTReadError: 4
	]

	#enum CXAvailabilityKind! [
		CXAvailability_Available: 0
		CXAvailability_Deprecated: 1
		CXAvailability_NotAvailable: 2
		CXAvailability_NotAccessible: 3
	]

	#enum CXGlobalOptFlags! [
		CXGlobalOpt_None: 0
		CXGlobalOpt_ThreadBackgroundPriorityForIndexing: 1
		CXGlobalOpt_ThreadBackgroundPriorityForEditing: 2
		CXGlobalOpt_ThreadBackgroundPriorityForAll: 3
	]

	#enum CXDiagnosticSeverity! [
		CXDiagnostic_Ignored: 0
		CXDiagnostic_Note: 1
		CXDiagnostic_Warning: 2
		CXDiagnostic_Error: 3
		CXDiagnostic_Fatal: 4
	]

	#enum CXLoadDiag_Error! [
		CXLoadDiag_None: 0
		CXLoadDiag_Unknown: 1
		CXLoadDiag_CannotLoad: 2
		CXLoadDiag_InvalidFile: 3
	]

	#enum CXDiagnosticDisplayOptions! [
		CXDiagnostic_DisplaySourceLocation: 1
		CXDiagnostic_DisplayColumn: 2
		CXDiagnostic_DisplaySourceRanges: 4
		CXDiagnostic_DisplayOption: 8
		CXDiagnostic_DisplayCategoryId: 16
		CXDiagnostic_DisplayCategoryName: 32
	]

	#enum CXTranslationUnit_Flags! [
		CXTranslationUnit_None: 0
		CXTranslationUnit_DetailedPreprocessingRecord: 1
		CXTranslationUnit_Incomplete: 2
		CXTranslationUnit_PrecompiledPreamble: 4
		CXTranslationUnit_CacheCompletionResults: 8
		CXTranslationUnit_ForSerialization: 16
		CXTranslationUnit_CXXChainedPCH: 32
		CXTranslationUnit_SkipFunctionBodies: 64
		CXTranslationUnit_IncludeBriefCommentsInCodeCompletion: 128
	]

	#enum CXSaveTranslationUnit_Flags! [
		CXSaveTranslationUnit_None: 0
	]

	#enum CXSaveError! [
		CXSaveError_None: 0
		CXSaveError_Unknown: 1
		CXSaveError_TranslationErrors: 2
		CXSaveError_InvalidTU: 3
	]

	#enum CXReparse_Flags! [
		CXReparse_None: 0
	]

	#enum CXTUResourceUsageKind! [
		CXTUResourceUsage_AST: 1
		CXTUResourceUsage_Identifiers: 2
		CXTUResourceUsage_Selectors: 3
		CXTUResourceUsage_GlobalCompletionResults: 4
		CXTUResourceUsage_SourceManagerContentCache: 5
		CXTUResourceUsage_AST_SideTables: 6
		CXTUResourceUsage_SourceManager_Membuffer_Malloc: 7
		CXTUResourceUsage_SourceManager_Membuffer_MMap: 8
		CXTUResourceUsage_ExternalASTSource_Membuffer_Malloc: 9
		CXTUResourceUsage_ExternalASTSource_Membuffer_MMap: 10
		CXTUResourceUsage_Preprocessor: 11
		CXTUResourceUsage_PreprocessingRecord: 12
		CXTUResourceUsage_SourceManager_DataStructures: 13
		CXTUResourceUsage_Preprocessor_HeaderSearch: 14
		CXTUResourceUsage_MEMORY_IN_BYTES_BEGIN: 1
		CXTUResourceUsage_MEMORY_IN_BYTES_END: 14
		CXTUResourceUsage_First: 1
		CXTUResourceUsage_Last: 14
	]

	#enum CXCursorKind! [
		CXCursor_UnexposedDecl: 1
		CXCursor_StructDecl: 2
		CXCursor_UnionDecl: 3
		CXCursor_ClassDecl: 4
		CXCursor_EnumDecl: 5
		CXCursor_FieldDecl: 6
		CXCursor_EnumConstantDecl: 7
		CXCursor_FunctionDecl: 8
		CXCursor_VarDecl: 9
		CXCursor_ParmDecl: 10
		CXCursor_ObjCInterfaceDecl: 11
		CXCursor_ObjCCategoryDecl: 12
		CXCursor_ObjCProtocolDecl: 13
		CXCursor_ObjCPropertyDecl: 14
		CXCursor_ObjCIvarDecl: 15
		CXCursor_ObjCInstanceMethodDecl: 16
		CXCursor_ObjCClassMethodDecl: 17
		CXCursor_ObjCImplementationDecl: 18
		CXCursor_ObjCCategoryImplDecl: 19
		CXCursor_TypedefDecl: 20
		CXCursor_CXXMethod: 21
		CXCursor_Namespace: 22
		CXCursor_LinkageSpec: 23
		CXCursor_Constructor: 24
		CXCursor_Destructor: 25
		CXCursor_ConversionFunction: 26
		CXCursor_TemplateTypeParameter: 27
		CXCursor_NonTypeTemplateParameter: 28
		CXCursor_TemplateTemplateParameter: 29
		CXCursor_FunctionTemplate: 30
		CXCursor_ClassTemplate: 31
		CXCursor_ClassTemplatePartialSpecialization: 32
		CXCursor_NamespaceAlias: 33
		CXCursor_UsingDirective: 34
		CXCursor_UsingDeclaration: 35
		CXCursor_TypeAliasDecl: 36
		CXCursor_ObjCSynthesizeDecl: 37
		CXCursor_ObjCDynamicDecl: 38
		CXCursor_CXXAccessSpecifier: 39
		CXCursor_FirstDecl: 1
		CXCursor_LastDecl: 39
		CXCursor_FirstRef: 40
		CXCursor_ObjCSuperClassRef: 40
		CXCursor_ObjCProtocolRef: 41
		CXCursor_ObjCClassRef: 42
		CXCursor_TypeRef: 43
		CXCursor_CXXBaseSpecifier: 44
		CXCursor_TemplateRef: 45
		CXCursor_NamespaceRef: 46
		CXCursor_MemberRef: 47
		CXCursor_LabelRef: 48
		CXCursor_OverloadedDeclRef: 49
		CXCursor_VariableRef: 50
		CXCursor_LastRef: 50
		CXCursor_FirstInvalid: 70
		CXCursor_InvalidFile: 70
		CXCursor_NoDeclFound: 71
		CXCursor_NotImplemented: 72
		CXCursor_InvalidCode: 73
		CXCursor_LastInvalid: 73
		CXCursor_FirstExpr: 100
		CXCursor_UnexposedExpr: 100
		CXCursor_DeclRefExpr: 101
		CXCursor_MemberRefExpr: 102
		CXCursor_CallExpr: 103
		CXCursor_ObjCMessageExpr: 104
		CXCursor_BlockExpr: 105
		CXCursor_IntegerLiteral: 106
		CXCursor_FloatingLiteral: 107
		CXCursor_ImaginaryLiteral: 108
		CXCursor_StringLiteral: 109
		CXCursor_CharacterLiteral: 110
		CXCursor_ParenExpr: 111
		CXCursor_UnaryOperator: 112
		CXCursor_ArraySubscriptExpr: 113
		CXCursor_BinaryOperator: 114
		CXCursor_CompoundAssignOperator: 115
		CXCursor_ConditionalOperator: 116
		CXCursor_CStyleCastExpr: 117
		CXCursor_CompoundLiteralExpr: 118
		CXCursor_InitListExpr: 119
		CXCursor_AddrLabelExpr: 120
		CXCursor_StmtExpr: 121
		CXCursor_GenericSelectionExpr: 122
		CXCursor_GNUNullExpr: 123
		CXCursor_CXXStaticCastExpr: 124
		CXCursor_CXXDynamicCastExpr: 125
		CXCursor_CXXReinterpretCastExpr: 126
		CXCursor_CXXConstCastExpr: 127
		CXCursor_CXXFunctionalCastExpr: 128
		CXCursor_CXXTypeidExpr: 129
		CXCursor_CXXBoolLiteralExpr: 130
		CXCursor_CXXNullPtrLiteralExpr: 131
		CXCursor_CXXThisExpr: 132
		CXCursor_CXXThrowExpr: 133
		CXCursor_CXXNewExpr: 134
		CXCursor_CXXDeleteExpr: 135
		CXCursor_UnaryExpr: 136
		CXCursor_ObjCStringLiteral: 137
		CXCursor_ObjCEncodeExpr: 138
		CXCursor_ObjCSelectorExpr: 139
		CXCursor_ObjCProtocolExpr: 140
		CXCursor_ObjCBridgedCastExpr: 141
		CXCursor_PackExpansionExpr: 142
		CXCursor_SizeOfPackExpr: 143
		CXCursor_LambdaExpr: 144
		CXCursor_ObjCBoolLiteralExpr: 145
		CXCursor_ObjCSelfExpr: 146
		CXCursor_LastExpr: 146
		CXCursor_FirstStmt: 200
		CXCursor_UnexposedStmt: 200
		CXCursor_LabelStmt: 201
		CXCursor_CompoundStmt: 202
		CXCursor_CaseStmt: 203
		CXCursor_DefaultStmt: 204
		CXCursor_IfStmt: 205
		CXCursor_SwitchStmt: 206
		CXCursor_WhileStmt: 207
		CXCursor_DoStmt: 208
		CXCursor_ForStmt: 209
		CXCursor_GotoStmt: 210
		CXCursor_IndirectGotoStmt: 211
		CXCursor_ContinueStmt: 212
		CXCursor_BreakStmt: 213
		CXCursor_ReturnStmt: 214
		CXCursor_GCCAsmStmt: 215
		CXCursor_AsmStmt: 215
		CXCursor_ObjCAtTryStmt: 216
		CXCursor_ObjCAtCatchStmt: 217
		CXCursor_ObjCAtFinallyStmt: 218
		CXCursor_ObjCAtThrowStmt: 219
		CXCursor_ObjCAtSynchronizedStmt: 220
		CXCursor_ObjCAutoreleasePoolStmt: 221
		CXCursor_ObjCForCollectionStmt: 222
		CXCursor_CXXCatchStmt: 223
		CXCursor_CXXTryStmt: 224
		CXCursor_CXXForRangeStmt: 225
		CXCursor_SEHTryStmt: 226
		CXCursor_SEHExceptStmt: 227
		CXCursor_SEHFinallyStmt: 228
		CXCursor_MSAsmStmt: 229
		CXCursor_NullStmt: 230
		CXCursor_DeclStmt: 231
		CXCursor_OMPParallelDirective: 232
		CXCursor_OMPSimdDirective: 233
		CXCursor_OMPForDirective: 234
		CXCursor_OMPSectionsDirective: 235
		CXCursor_OMPSectionDirective: 236
		CXCursor_OMPSingleDirective: 237
		CXCursor_OMPParallelForDirective: 238
		CXCursor_OMPParallelSectionsDirective: 239
		CXCursor_OMPTaskDirective: 240
		CXCursor_OMPMasterDirective: 241
		CXCursor_OMPCriticalDirective: 242
		CXCursor_OMPTaskyieldDirective: 243
		CXCursor_OMPBarrierDirective: 244
		CXCursor_OMPTaskwaitDirective: 245
		CXCursor_OMPFlushDirective: 246
		CXCursor_SEHLeaveStmt: 247
		CXCursor_LastStmt: 247
		CXCursor_TranslationUnit: 300
		CXCursor_FirstAttr: 400
		CXCursor_UnexposedAttr: 400
		CXCursor_IBActionAttr: 401
		CXCursor_IBOutletAttr: 402
		CXCursor_IBOutletCollectionAttr: 403
		CXCursor_CXXFinalAttr: 404
		CXCursor_CXXOverrideAttr: 405
		CXCursor_AnnotateAttr: 406
		CXCursor_AsmLabelAttr: 407
		CXCursor_PackedAttr: 408
		CXCursor_PureAttr: 409
		CXCursor_ConstAttr: 410
		CXCursor_NoDuplicateAttr: 411
		CXCursor_CUDAConstantAttr: 412
		CXCursor_CUDADeviceAttr: 413
		CXCursor_CUDAGlobalAttr: 414
		CXCursor_CUDAHostAttr: 415
		CXCursor_LastAttr: 415
		CXCursor_PreprocessingDirective: 500
		CXCursor_MacroDefinition: 501
		CXCursor_MacroExpansion: 502
		CXCursor_MacroInstantiation: 502
		CXCursor_InclusionDirective: 503
		CXCursor_FirstPreprocessing: 500
		CXCursor_LastPreprocessing: 503
		CXCursor_ModuleImportDecl: 600
		CXCursor_FirstExtraDecl: 600
		CXCursor_LastExtraDecl: 600
	]

	#enum CXLinkageKind! [
		CXLinkage_Invalid: 0
		CXLinkage_NoLinkage: 1
		CXLinkage_Internal: 2
		CXLinkage_UniqueExternal: 3
		CXLinkage_External: 4
	]

	#enum CXLanguageKind! [
		CXLanguage_Invalid: 0
		CXLanguage_C: 1
		CXLanguage_ObjC: 2
		CXLanguage_CPlusPlus: 3
	]

	#enum CXTypeKind! [
		CXType_Invalid: 0
		CXType_Unexposed: 1
		CXType_Void: 2
		CXType_Bool: 3
		CXType_Char_U: 4
		CXType_UChar: 5
		CXType_Char16: 6
		CXType_Char32: 7
		CXType_UShort: 8
		CXType_UInt: 9
		CXType_ULong: 10
		CXType_ULongLong: 11
		CXType_UInt128: 12
		CXType_Char_S: 13
		CXType_SChar: 14
		CXType_WChar: 15
		CXType_Short: 16
		CXType_Int: 17
		CXType_Long: 18
		CXType_LongLong: 19
		CXType_Int128: 20
		CXType_Float: 21
		CXType_Double: 22
		CXType_LongDouble: 23
		CXType_NullPtr: 24
		CXType_Overload: 25
		CXType_Dependent: 26
		CXType_ObjCId: 27
		CXType_ObjCClass: 28
		CXType_ObjCSel: 29
		CXType_FirstBuiltin: 2
		CXType_LastBuiltin: 29
		CXType_Complex: 100
		CXType_Pointer: 101
		CXType_BlockPointer: 102
		CXType_LValueReference: 103
		CXType_RValueReference: 104
		CXType_Record: 105
		CXType_Enum: 106
		CXType_Typedef: 107
		CXType_ObjCInterface: 108
		CXType_ObjCObjectPointer: 109
		CXType_FunctionNoProto: 110
		CXType_FunctionProto: 111
		CXType_ConstantArray: 112
		CXType_Vector: 113
		CXType_IncompleteArray: 114
		CXType_VariableArray: 115
		CXType_DependentSizedArray: 116
		CXType_MemberPointer: 117
	]

	#enum CXCallingConv! [
		CXCallingConv_Default: 0
		CXCallingConv_C: 1
		CXCallingConv_X86StdCall: 2
		CXCallingConv_X86FastCall: 3
		CXCallingConv_X86ThisCall: 4
		CXCallingConv_X86Pascal: 5
		CXCallingConv_AAPCS: 6
		CXCallingConv_AAPCS_VFP: 7
		CXCallingConv_PnaclCall: 8
		CXCallingConv_IntelOclBicc: 9
		CXCallingConv_X86_64Win64: 10
		CXCallingConv_X86_64SysV: 11
		CXCallingConv_Invalid: 100
		CXCallingConv_Unexposed: 200
	]

	#enum CXTypeLayoutError! [
		CXTypeLayoutError_Invalid: -1
		CXTypeLayoutError_Incomplete: -2
		CXTypeLayoutError_Dependent: -3
		CXTypeLayoutError_NotConstantSize: -4
		CXTypeLayoutError_InvalidFieldName: -5
	]

	#enum CXRefQualifierKind! [
		CXRefQualifier_None: 0
		CXRefQualifier_LValue: 1
		CXRefQualifier_RValue: 2
	]

	#enum CX_CXXAccessSpecifier! [
		CX_CXXInvalidAccessSpecifier: 0
		CX_CXXPublic: 1
		CX_CXXProtected: 2
		CX_CXXPrivate: 3
	]

	#enum CXChildVisitResult! [
		CXChildVisit_Break: 0
		CXChildVisit_Continue: 1
		CXChildVisit_Recurse: 2
	]

	#enum CXCursorVisitor! [
		CXCursorVisit_Break: 0
		CXCursorVisit_Continue: 1
		CXCursorVisit_Recurse: 2
	]

	#enum CXObjCPropertyAttrKind! [
		CXObjCPropertyAttr_noattr: 0
		CXObjCPropertyAttr_readonly: 1
		CXObjCPropertyAttr_getter: 2
		CXObjCPropertyAttr_assign: 4
		CXObjCPropertyAttr_readwrite: 8
		CXObjCPropertyAttr_retain: 16
		CXObjCPropertyAttr_copy: 32
		CXObjCPropertyAttr_nonatomic: 64
		CXObjCPropertyAttr_setter: 128
		CXObjCPropertyAttr_atomic: 256
		CXObjCPropertyAttr_weak: 512
		CXObjCPropertyAttr_strong: 1024
		CXObjCPropertyAttr_unsafe_unretained: 2048
	]

	#enum CXObjCDeclQualifierKind! [
		CXObjCDeclQualifier_None: 0
		CXObjCDeclQualifier_In: 1
		CXObjCDeclQualifier_Inout: 2
		CXObjCDeclQualifier_Out: 4
		CXObjCDeclQualifier_Bycopy: 8
		CXObjCDeclQualifier_Byref: 16
		CXObjCDeclQualifier_Oneway: 32
	]

	#enum CXNameRefFlags! [
		CXNameRange_WantQualifier: 1
		CXNameRange_WantTemplateArgs: 2
		CXNameRange_WantSinglePiece: 4
	]

	#enum CXTokenKind! [
		CXToken_Punctuation: 0
		CXToken_Keyword: 1
		CXToken_Identifier: 2
		CXToken_Literal: 3
		CXToken_Comment: 4
	]

	#enum CXCompletionChunkKind! [
		CXCompletionChunk_Optional: 0
		CXCompletionChunk_TypedText: 1
		CXCompletionChunk_Text: 2
		CXCompletionChunk_Placeholder: 3
		CXCompletionChunk_Informative: 4
		CXCompletionChunk_CurrentParameter: 5
		CXCompletionChunk_LeftParen: 6
		CXCompletionChunk_RightParen: 7
		CXCompletionChunk_LeftBracket: 8
		CXCompletionChunk_RightBracket: 9
		CXCompletionChunk_LeftBrace: 10
		CXCompletionChunk_RightBrace: 11
		CXCompletionChunk_LeftAngle: 12
		CXCompletionChunk_RightAngle: 13
		CXCompletionChunk_Comma: 14
		CXCompletionChunk_ResultType: 15
		CXCompletionChunk_Colon: 16
		CXCompletionChunk_SemiColon: 17
		CXCompletionChunk_Equal: 18
		CXCompletionChunk_HorizontalSpace: 19
		CXCompletionChunk_VerticalSpace: 20
	]

	#enum CXCodeComplete_Flags! [
		CXCodeComplete_IncludeMacros: 1
		CXCodeComplete_IncludeCodePatterns: 2
		CXCodeComplete_IncludeBriefComments: 4
	]

	#enum CXCompletionContext! [
		CXCompletionContext_Unexposed: 0
		CXCompletionContext_AnyType: 1
		CXCompletionContext_AnyValue: 2
		CXCompletionContext_ObjCObjectValue: 4
		CXCompletionContext_ObjCSelectorValue: 8
		CXCompletionContext_CXXClassTypeValue: 16
		CXCompletionContext_DotMemberAccess: 32
		CXCompletionContext_ArrowMemberAccess: 64
		CXCompletionContext_ObjCPropertyAccess: 128
		CXCompletionContext_EnumTag: 256
		CXCompletionContext_UnionTag: 512
		CXCompletionContext_StructTag: 1024
		CXCompletionContext_ClassTag: 2048
		CXCompletionContext_Namespace: 4096
		CXCompletionContext_NestedNameSpecifier: 8192
		CXCompletionContext_ObjCInterface: 16384
		CXCompletionContext_ObjCProtocol: 32768
		CXCompletionContext_ObjCCategory: 65536
		CXCompletionContext_ObjCInstanceMessage: 131072
		CXCompletionContext_ObjCClassMessage: 262144
		CXCompletionContext_ObjCSelectorName: 524288
		CXCompletionContext_MacroName: 1048576
		CXCompletionContext_NaturalLanguage: 2097152
		CXCompletionContext_Unknown: 4194303
	]

	#enum CXVisitorResult! [
		CXVisit_Break: 0
		CXVisit_Continue: 1
	]

	#enum CXResult! [
		CXResult_Success: 0
		CXResult_Invalid: 1
		CXResult_VisitBreak: 2
	]

	#enum CXIdxEntityKind! [
		CXIdxEntity_Unexposed: 0
		CXIdxEntity_Typedef: 1
		CXIdxEntity_Function: 2
		CXIdxEntity_Variable: 3
		CXIdxEntity_Field: 4
		CXIdxEntity_EnumConstant: 5
		CXIdxEntity_ObjCClass: 6
		CXIdxEntity_ObjCProtocol: 7
		CXIdxEntity_ObjCCategory: 8
		CXIdxEntity_ObjCInstanceMethod: 9
		CXIdxEntity_ObjCClassMethod: 10
		CXIdxEntity_ObjCProperty: 11
		CXIdxEntity_ObjCIvar: 12
		CXIdxEntity_Enum: 13
		CXIdxEntity_Struct: 14
		CXIdxEntity_Union: 15
		CXIdxEntity_CXXClass: 16
		CXIdxEntity_CXXNamespace: 17
		CXIdxEntity_CXXNamespaceAlias: 18
		CXIdxEntity_CXXStaticVariable: 19
		CXIdxEntity_CXXStaticMethod: 20
		CXIdxEntity_CXXInstanceMethod: 21
		CXIdxEntity_CXXConstructor: 22
		CXIdxEntity_CXXDestructor: 23
		CXIdxEntity_CXXConversionFunction: 24
		CXIdxEntity_CXXTypeAlias: 25
		CXIdxEntity_CXXInterface: 26
	]

	#enum CXIdxEntityLanguage! [
		CXIdxEntityLang_None: 0
		CXIdxEntityLang_C: 1
		CXIdxEntityLang_ObjC: 2
		CXIdxEntityLang_CXX: 3
	]

	#enum CXIdxEntityCXXTemplateKind! [
		CXIdxEntity_NonTemplate: 0
		CXIdxEntity_Template: 1
		CXIdxEntity_TemplatePartialSpecialization: 2
		CXIdxEntity_TemplateSpecialization: 3
	]

	#enum CXIdxAttrKind! [
		CXIdxAttr_Unexposed: 0
		CXIdxAttr_IBAction: 1
		CXIdxAttr_IBOutlet: 2
		CXIdxAttr_IBOutletCollection: 3
	]

	#enum CXIdxDeclInfoFlags! [
		CXIdxDeclFlag_Skipped: 1
	]

	#enum CXIdxObjCContainerKind! [
		CXIdxObjCContainer_ForwardRef: 0
		CXIdxObjCContainer_Interface: 1
		CXIdxObjCContainer_Implementation: 2
	]

	#enum CXIdxEntityRefKind! [
		CXIdxEntityRef_Direct: 1
		CXIdxEntityRef_Implicit: 2
	]

	#enum CXIndexOptFlags! [
		CXIndexOpt_None: 0
		CXIndexOpt_SuppressRedundantRefs: 1
		CXIndexOpt_IndexFunctionLocalSymbols: 2
		CXIndexOpt_IndexImplicitTemplateInstantiations: 4
		CXIndexOpt_SuppressWarnings: 8
		CXIndexOpt_SkipParsedBodiesInSession: 16
	]

	#enum CXCommentKind! [
		CXComment_Null: 0
		CXComment_Text: 1
		CXComment_InlineCommand: 2
		CXComment_HTMLStartTag: 3
		CXComment_HTMLEndTag: 4
		CXComment_Paragraph: 5
		CXComment_BlockCommand: 6
		CXComment_ParamCommand: 7
		CXComment_TParamCommand: 8
		CXComment_VerbatimBlockCommand: 9
		CXComment_VerbatimBlockLine: 10
		CXComment_VerbatimLine: 11
		CXComment_FullComment: 12
	]

	#enum CXCommentInlineCommandRenderKind! [
		CXCommentInlineCommandRenderKind_Normal: 0
		CXCommentInlineCommandRenderKind_Bold: 1
		CXCommentInlineCommandRenderKind_Monospaced: 2
		CXCommentInlineCommandRenderKind_Emphasized: 3
	]

	#enum CXCommentParamPassDirection! [
		CXCommentParamPassDirection_In: 0
		CXCommentParamPassDirection_Out: 1
		CXCommentParamPassDirection_InOut: 2
	]

	CXString!: alias struct! [
		data [void-ptr!]
		private_flags [uint32!]
	]

	CXSourceLocation!: alias struct! [
		ptr_data [void-ptr!]
		int_data [uint32!]
	]

	CXSourceRange!: alias struct! [
		ptr_data [void-ptr!]
		begin_int_data [uint32!]
		end_int_data [uint32!]
	]

	CXTUResourceUsage!: alias struct! [
		data [void-ptr!]
		numEntries [uint32!]
		entries [void-ptr!]
	]

	CXCursor!: alias struct! [
		kind [int32!]
		xdata [int32!]
		data [void-ptr!]
	]

	CXType!: alias struct! [
		kind [int32!]
		data [void-ptr!]
	]

	CXToken!: alias struct! [
		int_data [uint32!]
		ptr_data [void-ptr!]
	]

	CXCursorAndRangeVisitor!: alias struct! [
		context [void-ptr!]
		visit [void-ptr!]
	]

	CXIdxLoc!: alias struct! [
		ptr_data [void-ptr!]
		int_data [uint32!]
	]

	CXComment!: alias struct! [
		ASTNode [void-ptr!]
		TranslationUnit [void-ptr!]
	]

	#import [
		LIBCLANG cdecl [
			getCString: "clang_getCString" [
				string [CXString!]
				return: [void-ptr!]
			]

			disposeString: "clang_disposeString" [
				string [CXString!]
			]

			;getBuildSessionTimestamp: "clang_getBuildSessionTimestamp" [
			;	return: [uint64!]
			;]

			VirtualFileOverlay_create: "clang_VirtualFileOverlay_create" [
				options [uint32!]
				return: [void-ptr!]
			]

			VirtualFileOverlay_addFileMapping: "clang_VirtualFileOverlay_addFileMapping" [
				arg1 [void-ptr!]
				virtualPath [void-ptr!]
				realPath [void-ptr!]
				return: [int32!]
			]

			VirtualFileOverlay_setCaseSensitivity: "clang_VirtualFileOverlay_setCaseSensitivity" [
				arg1 [void-ptr!]
				caseSensitive [int32!]
				return: [int32!]
			]

			VirtualFileOverlay_writeToBuffer: "clang_VirtualFileOverlay_writeToBuffer" [
				arg1 [void-ptr!]
				options [uint32!]
				out_buffer_ptr [void-ptr!]
				out_buffer_size [void-ptr!]
				return: [int32!]
			]

			VirtualFileOverlay_dispose: "clang_VirtualFileOverlay_dispose" [
				arg1 [void-ptr!]
			]

			ModuleMapDescriptor_create: "clang_ModuleMapDescriptor_create" [
				options [uint32!]
				return: [void-ptr!]
			]

			ModuleMapDescriptor_setFrameworkModuleName: "clang_ModuleMapDescriptor_setFrameworkModuleName" [
				arg1 [void-ptr!]
				name [void-ptr!]
				return: [int32!]
			]

			ModuleMapDescriptor_setUmbrellaHeader: "clang_ModuleMapDescriptor_setUmbrellaHeader"[
				arg1 [void-ptr!]
				name [void-ptr!]
				return: [int32!]
			]

			ModuleMapDescriptor_writeToBuffer: "clang_ModuleMapDescriptor_writeToBuffer" [
				arg1 [void-ptr!]
				options [uint32!]
				out_buffer_ptr [void-ptr!]
				out_buffer_size [void-ptr!]
				return: [int32!]
			]

			ModuleMapDescriptor_dispose: "clang_ModuleMapDescriptor_dispose" [
				arg1 [void-ptr!]
			]

			createIndex: "clang_createIndex" [
				excludeDeclarationsFromPCH [int32!]
				displayDiagnostics [int32!]
				return: [void-ptr!]
			]

			disposeIndex: "clang_disposeIndex" [
				index [void-ptr!]
			]

			CXIndex_setGlobalOptions: "clang_CXIndex_setGlobalOptions" [
				arg1 [void-ptr!]
				options [uint32!]
			]

			CXIndex_getGlobalOptions: "clang_CXIndex_getGlobalOptions" [
				arg1 [void-ptr!]
				return: [uint32!]
			]

			getFileName: "clang_getFileName" [
				SFile [void-ptr!]
				return: [CXString!]
			]

			getFileTime: "clang_getFileTime" [
				SFile [void-ptr!]
				return: [int32!]
			]

			getFileUniqueID: "clang_getFileUniqueID" [
				file [void-ptr!]
				outID [void-ptr!]
				return: [int32!]
			]

			isFileMultipleIncludeGuarded: "clang_isFileMultipleIncludeGuarded" [
				tu [void-ptr!]
				file [void-ptr!]
				return: [uint32!]
			]

			getFile: "clang_getFile" [
				tu [void-ptr!]
				file_name [void-ptr!]
				return: [void-ptr!]
			]

			getNullLocation: "clang_getNullLocation" [
				return: [CXSourceLocation!]
			]

			equalLocations: "clang_equalLocations" [
				loc1 [CXSourceLocation!]
				loc2 [CXSourceLocation!]
				return: [uint32!]
			]

			getLocation: "clang_getLocation" [
				tu [void-ptr!]
				file [void-ptr!]
				line [uint32!]
				column [uint32!]
				return: [CXSourceLocation!]
			]

			getLocationForOffset: "clang_getLocationForOffset" [
				tu [void-ptr!]
				file [void-ptr!]
				offset [uint32!]
				return: [CXSourceLocation!]
			]

			Location_isInSystemHeader: "clang_Location_isInSystemHeader" [
				location [CXSourceLocation!]
				return: [int32!]
			]

			Location_isFromMainFile: "clang_Location_isFromMainFile" [
				location [CXSourceLocation!]
				return: [int32!]
			]

			getNullRange: "clang_getNullRange" [
				return: [CXSourceRange!]
			]

			getRange: "clang_getRange" [
				begin [CXSourceLocation!]
				end [CXSourceLocation!]
				return: [CXSourceRange!]
			]

			equalRanges: "clang_equalRanges" [
				range1 [CXSourceRange!]
				range2 [CXSourceRange!]
				return: [uint32!]
			]

			Range_isNull: "clang_Range_isNull" [
				range [CXSourceRange!]
				return: [int32!]
			]

			getExpansionLocation: "clang_getExpansionLocation" [
				location [CXSourceLocation!]
				file [void-ptr!]
				line [void-ptr!]
				column [void-ptr!]
				offset [void-ptr!]
			]

			getPresumedLocation: "clang_getPresumedLocation" [
				location [CXSourceLocation!]
				filename [void-ptr!]
				line [void-ptr!]
				column [void-ptr!]
			]

			getInstantiationLocation: "clang_getInstantiationLocation" [
				location [CXSourceLocation!]
				file [void-ptr!]
				line [void-ptr!]
				column [void-ptr!]
				offset [void-ptr!]
			]

			getSpellingLocation: "clang_getSpellingLocation" [
				location [CXSourceLocation!]
				file [void-ptr!]
				line [void-ptr!]
				column [void-ptr!]
				offset [void-ptr!]
			]

			getFileLocation: "clang_getFileLocation" [
				location [CXSourceLocation!]
				file [void-ptr!]
				line [void-ptr!]
				column [void-ptr!]
				offset [void-ptr!]
			]

			getRangeStart: "clang_getRangeStart" [
				range [CXSourceRange!]
				return: [CXSourceLocation!]
			]

			getRangeEnd: "clang_getRangeEnd" [
				range [CXSourceRange!]
				return: [CXSourceLocation!]
			]

			getSkippedRanges: "clang_getSkippedRanges" [
				tu [void-ptr!]
				file [void-ptr!]
				return: [void-ptr!]
			]

			disposeSourceRangeList: "clang_disposeSourceRangeList" [
				ranges [void-ptr!]
			]

			getNumDiagnosticsInSet: "clang_getNumDiagnosticsInSet" [
				Diags [void-ptr!]
				return: [uint32!]
			]

			getDiagnosticInSet: "clang_getDiagnosticInSet"[
				Diags [void-ptr!]
				Index [uint32!]
				return: [void-ptr!]
			]

			loadDiagnostics: "clang_loadDiagnostics" [
				file [void-ptr!]
				error [void-ptr!]
				errorString [void-ptr!]
				return: [void-ptr!]
			]

			disposeDiagnosticSet: "clang_disposeDiagnosticSet" [
				Diags [void-ptr!]
			]

			getChildDiagnostics: "clang_getChildDiagnostics" [
				D [void-ptr!]
				return: [void-ptr!]
			]

			getNumDiagnostics: "clang_getNumDiagnostics" [
				Unit [void-ptr!]
				return: [uint32!]
			]

			getDiagnostic: "clang_getDiagnostic" [
				Unit [void-ptr!]
				Index [uint32!]
				return: [void-ptr!]
			]

			getDiagnosticSetFromTU: "clang_getDiagnosticSetFromTU" [
				Unit [void-ptr!]
				return: [void-ptr!]
			]

			disposeDiagnostic: "clang_disposeDiagnostic" [
				Diagnostic [void-ptr!]
			]

			formatDiagnostic: "clang_formatDiagnostic" [
				Diagnostic [void-ptr!]
				Options [uint32!]
				return: [CXString!]
			]

			defaultDiagnosticDisplayOptions: "clang_defaultDiagnosticDisplayOptions" [
				return: [uint32!]
			]

			getDiagnosticSeverity: "clang_getDiagnosticSeverity" [
				arg1 [void-ptr!]
				return: [int32!]
			]

			getDiagnosticLocation: "clang_getDiagnosticLocation" [
				arg1 [void-ptr!]
				return: [CXSourceLocation!]
			]

			getDiagnosticSpelling: "clang_getDiagnosticSpelling" [
				arg1 [void-ptr!]
				return: [CXString!]
			]

			getDiagnosticOption: "clang_getDiagnosticOption" [
				Diag [void-ptr!]
				Disable [void-ptr!]
				return: [CXString!]
			]

			getDiagnosticCategory: "clang_getDiagnosticCategory" [
				arg1 [void-ptr!]
				return: [uint32!]
			]

			getDiagnosticCategoryName: "clang_getDiagnosticCategoryName" [
				Category [uint32!]
				return: [CXString!]
			]

			getDiagnosticCategoryText: "clang_getDiagnosticCategoryText" [
				arg1 [void-ptr!]
				return: [CXString!]
			]

			getDiagnosticNumRanges: "clang_getDiagnosticNumRanges" [
				arg1 [void-ptr!]
				return: [uint32!]
			]

			getDiagnosticRange: "clang_getDiagnosticRange" [
				Diagnostic [void-ptr!]
				Range [uint32!]
				return: [CXSourceRange!]
			]

			getDiagnosticNumFixIts: "clang_getDiagnosticNumFixIts" [
				Diagnostic [void-ptr!]
				return: [uint32!]
			]

			getDiagnosticFixIt: "clang_getDiagnosticFixIt" [
				Diagnostic [void-ptr!]
				FixIt [uint32!]
				ReplacementRange [void-ptr!]
				return: [CXString!]
			]

			getTranslationUnitSpelling: "clang_getTranslationUnitSpelling" [
				CTUnit [void-ptr!]
				return: [CXString!]
			]

			createTranslationUnitFromSourceFile: "clang_createTranslationUnitFromSourceFile" [
				CIdx [void-ptr!]
				source_filename [void-ptr!]
				num_clang_command_line_args [int32!]
				clang_command_line_args [void-ptr!]
				num_unsaved_files [uint32!]
				unsaved_files [void-ptr!]
				return: [void-ptr!]
			]

			createTranslationUnit: "clang_createTranslationUnit" [
				CIdx [void-ptr!]
				ast_filename [void-ptr!]
				return: [void-ptr!]
			]

			createTranslationUnit2: "clang_createTranslationUnit2" [
				CIdx [void-ptr!]
				ast_filename [void-ptr!]
				out_TU [void-ptr!]
				return: [int32!]
			]

			defaultEditingTranslationUnitOptions: "clang_defaultEditingTranslationUnitOptions" [
				return: [uint32!]
			]

			parseTranslationUnit: "clang_parseTranslationUnit" [
				CIdx [void-ptr!]
				source_filename [void-ptr!]
				command_line_args [void-ptr!]
				num_command_line_args [int32!]
				unsaved_files [void-ptr!]
				num_unsaved_files [uint32!]
				options [uint32!]
				return: [void-ptr!]
			]

			parseTranslationUnit2: "clang_parseTranslationUnit2" [
				CIdx [void-ptr!]
				source_filename [void-ptr!]
				command_line_args [void-ptr!]
				num_command_line_args [int32!]
				unsaved_files [void-ptr!]
				num_unsaved_files [uint32!]
				options [uint32!]
				out_TU [void-ptr!]
				return: [int32!]
			]

			defaultSaveOptions: "clang_defaultSaveOptions" [
				TU [void-ptr!]
				return: [uint32!]
			]

			saveTranslationUnit: "clang_saveTranslationUnit" [
				TU [void-ptr!]
				FileName [void-ptr!]
				options [uint32!]
				return: [int32!]
			]

			disposeTranslationUnit: "clang_disposeTranslationUnit" [
				arg1 [void-ptr!]
			]

			defaultReparseOptions: "clang_defaultReparseOptions" [
				TU [void-ptr!]
				return: [uint32!]
			]

			reparseTranslationUnit: "clang_reparseTranslationUnit" [
				TU [void-ptr!]
				num_unsaved_files [uint32!]
				unsaved_files [void-ptr!]
				options [uint32!]
				return: [int32!]
			]

			getTUResourceUsageName: "clang_getTUResourceUsageName" [
				kind [int32!]
				return: [void-ptr!]
			]

			getCXTUResourceUsage: "clang_getCXTUResourceUsage" [
				TU [void-ptr!]
				return: [CXTUResourceUsage!]
			]

			disposeCXTUResourceUsage: "clang_disposeCXTUResourceUsage" [
				usage [CXTUResourceUsage!]
			]

			getNullCursor: "clang_getNullCursor" [
				return: [CXCursor!]
			]

			getTranslationUnitCursor: "clang_getTranslationUnitCursor" [
				arg1 [void-ptr!]
				return: [CXCursor!]
			]

			equalCursors: "clang_equalCursors" [
				arg1 [CXCursor!]
				arg2 [CXCursor!]
				return: [uint32!]
			]

			Cursor_isNull: "clang_Cursor_isNull" [
				cursor [CXCursor!]
				return: [int32!]
			]

			hashCursor: "clang_hashCursor" [
				arg1 [CXCursor!]
				return: [uint32!]
			]

			getCursorKind: "clang_getCursorKind" [
				arg1 [CXCursor!]
				return: [int32!]
			]

			isDeclaration: "clang_isDeclaration" [
				arg1 [int32!]
				return: [uint32!]
			]

			isReference: "clang_isReference" [
				arg1 [int32!]
				return: [uint32!]
			]

			isExpression: "clang_isExpression" [
				arg1 [int32!]
				return: [uint32!]
			]

			isStatement: "clang_isStatement" [
				arg1 [int32!]
				return: [uint32!]
			]

			isAttribute: "clang_isAttribute" [
				arg1 [int32!]
				return: [uint32!]
			]

			isInvalid: "clang_isInvalid" [
				arg1 [int32!]
				return: [uint32!]
			]

			isTranslationUnit: "clang_isTranslationUnit" [
				arg1 [int32!]
				return: [uint32!]
			]

			isPreprocessing: "clang_isPreprocessing" [
				arg1 [int32!]
				return: [uint32!]
			]

			isUnexposed: "clang_isUnexposed" [
				arg1 [int32!]
				return: [uint32!]
			]

			getCursorLinkage: "clang_getCursorLinkage" [
				cursor [CXCursor!]
				return: [int32!]
			]

			getCursorAvailability: "clang_getCursorAvailability" [
				cursor [CXCursor!]
				return: [int32!]
			]

			getCursorPlatformAvailability: "clang_getCursorPlatformAvailability" [
				cursor [CXCursor!]
				always_deprecated [void-ptr!]
				deprecated_message [void-ptr!]
				always_unavailable [void-ptr!]
				unavailable_message [void-ptr!]
				availability [void-ptr!]
				availability_size [int32!]
				return: [int32!]
			]

			disposeCXPlatformAvailability: "clang_disposeCXPlatformAvailability" [
				availability [void-ptr!]
			]

			getCursorLanguage: "clang_getCursorLanguage" [
				cursor [CXCursor!]
				return: [int32!]
			]

			Cursor_getTranslationUnit: "clang_Cursor_getTranslationUnit" [
				arg1 [CXCursor!]
				return: [void-ptr!]
			]

			createCXCursorSet: "clang_createCXCursorSet" [
				return: [void-ptr!]
			]

			disposeCXCursorSet: "clang_disposeCXCursorSet" [
				cset [void-ptr!]
			]

			CXCursorSet_contains: "clang_CXCursorSet_contains" [
				cset [void-ptr!]
				cursor [CXCursor!]
				return: [uint32!]
			]

			CXCursorSet_insert: "clang_CXCursorSet_insert" [
				cset [void-ptr!]
				cursor [CXCursor!]
				return: [uint32!]
			]

			getCursorSemanticParent: "clang_getCursorSemanticParent" [
				cursor [CXCursor!]
				return: [CXCursor!]
			]

			getCursorLexicalParent: "clang_getCursorLexicalParent" [
				cursor [CXCursor!]
				return: [CXCursor!]
			]

			getOverriddenCursors: "clang_getOverriddenCursors" [
				cursor [CXCursor!]
				overridden [void-ptr!]
				num_overridden [void-ptr!]
			]

			disposeOverriddenCursors: "clang_disposeOverriddenCursors" [
				overridden [void-ptr!]
			]

			getIncludedFile: "clang_getIncludedFile" [
				cursor [CXCursor!]
				return: [void-ptr!]
			]

			getCursor: "clang_getCursor" [
				arg1 [void-ptr!]
				arg2 [CXSourceLocation!]
				return: [CXCursor!]
			]

			getCursorLocation: "clang_getCursorLocation" [
				arg1 [CXCursor!]
				return: [CXSourceLocation!]
			]

			getCursorExtent: "clang_getCursorExtent" [
				arg1 [CXCursor!]
				return: [CXSourceRange!]
			]

			getCursorType: "clang_getCursorType" [
				C [CXCursor!]
				return: [CXType!]
			]

			getTypeSpelling: "clang_getTypeSpelling" [
				CT [CXType!]
				return: [CXString!]
			]

			getTypedefDeclUnderlyingType: "clang_getTypedefDeclUnderlyingType" [
				C [CXCursor!]
				return: [CXType!]
			]

			getEnumDeclIntegerType: "clang_getEnumDeclIntegerType" [
				C [CXCursor!]
				return: [CXType!]
			]

			getEnumConstantDeclValue: "clang_getEnumConstantDeclValue" [
				C [CXCursor!]
				return: [int64!]
			]

			getEnumConstantDeclUnsignedValue: "clang_getEnumConstantDeclUnsignedValue" [
				C [CXCursor!]
				return: [uint64!]
			]

			getFieldDeclBitWidth: "clang_getFieldDeclBitWidth" [
				C [CXCursor!]
				return: [int32!]
			]

			Cursor_getNumArguments: "clang_Cursor_getNumArguments" [
				C [CXCursor!]
				return: [int32!]
			]

			Cursor_getArgument: "clang_Cursor_getArgument" [
				C [CXCursor!]
				i [uint32!]
				return: [CXCursor!]
			]

			equalTypes: "clang_equalTypes" [
				A [CXType!]
				B [CXType!]
				return: [uint32!]
			]

			getCanonicalType: "clang_getCanonicalType" [
				T [CXType!]
				return: [CXType!]

			]

			isConstQualifiedType: "clang_isConstQualifiedType" [
				T [CXType!]
				return: [uint32!]
			]

			isVolatileQualifiedType: "clang_isVolatileQualifiedType" [
				T [CXType!]
				return: [uint32!]
			]

			isRestrictQualifiedType: "clang_isRestrictQualifiedType" [
				T [CXType!]
				return: [uint32!]
			]

			getPointeeType: "clang_getPointeeType" [
				T [CXType!]
				return: [CXType!]
			]

			getTypeDeclaration: "clang_getTypeDeclaration" [
				T [CXType!]
				return: [CXCursor!]
			]

			getDeclObjCTypeEncoding: "clang_getDeclObjCTypeEncoding" [
				C [CXCursor!]
				return: [CXString!]
			]

			getTypeKindSpelling: "clang_getTypeKindSpelling" [
				K [int32!]
				return: [CXString!]
			]

			getFunctionTypeCallingConv: "clang_getFunctionTypeCallingConv" [
				T [CXType!]
				return: [int32!]
			]

			getResultType: "clang_getResultType" [
				T [CXType!]
				return: [CXType!]
			]

			getNumArgTypes: "clang_getNumArgTypes" [
				T [CXType!]
				return: [int32!]
			]

			getArgType: "clang_getArgType" [
				T [CXType!]
				i [uint32!]
				return: [CXType!]
			]

			isFunctionTypeVariadic: "clang_isFunctionTypeVariadic" [
				T [CXType!]
				return: [uint32!]
			]

			getCursorResultType: "clang_getCursorResultType" [
				C [CXCursor!]
				return: [CXType!]
			]

			isPODType: "clang_isPODType" [
				T [CXType!]
				return: [uint32!]
			]

			getElementType: "clang_getElementType" [
				T [CXType!]
				return: [CXType!]
			]

			getNumElements: "clang_getNumElements" [
				T [CXType!]
				return: [int64!]
			]

			getArrayElementType: "clang_getArrayElementType" [
				T [CXType!]
				return: [CXType!]
			]

			getArraySize: "clang_getArraySize" [
				T [CXType!]
				return: [int64!]
			]

			Type_getAlignOf: "clang_Type_getAlignOf" [
				T [CXType!]
				return: [int64!]
			]

			Type_getClassType: "clang_Type_getClassType" [
				T [CXType!]
				return: [CXType!]
			]

			Type_getSizeOf: "clang_Type_getSizeOf" [
				T [CXType!]
				return: [int64!]
			]

			Type_getOffsetOf: "clang_Type_getOffsetOf" [
				T [CXType!]
				S [void-ptr!]
				return: [int64!]
			]

			Type_getNumTemplateArguments: "clang_Type_getNumTemplateArguments" [
				T [CXType!]
				return: [int32!]
			]

			Type_getTemplateArgumentAsType: "clang_Type_getTemplateArgumentAsType" [
				T [CXType!]
				i [uint32!]
				return: [CXType!]
			]

			Type_getCXXRefQualifier: "clang_Type_getCXXRefQualifier" [
				T [CXType!]
				return: [int32!]
			]

			Cursor_isBitField: "clang_Cursor_isBitField" [
				C [CXCursor!]
				return: [uint32!]
			]

			isVirtualBase: "clang_isVirtualBase" [
				arg1 [CXCursor!]
				return: [uint32!]
			]

			getCXXAccessSpecifier: "clang_getCXXAccessSpecifier" [
				arg1 [CXCursor!]
				return: [int32!]
			]

			getNumOverloadedDecls: "clang_getNumOverloadedDecls" [
				cursor [CXCursor!]
				return: [uint32!]
			]

			getOverloadedDecl: "clang_getOverloadedDecl" [
				cursor [CXCursor!]
				index [uint32!]
				return: [CXCursor!]
			]

			getIBOutletCollectionType: "clang_getIBOutletCollectionType" [
				arg1 [CXCursor!]
				return: [CXType!]
			]

			visitChildren: "clang_visitChildren" [
				parent [CXCursor!]
				visitor [void-ptr!]
				client_data [void-ptr!]
				return: [uint32!]
			]

			getCursorUSR: "clang_getCursorUSR" [
				arg1 [CXCursor!]
				return: [CXString!]
			]

			constructUSR_ObjCClass: "clang_constructUSR_ObjCClass" [
				class_name [void-ptr!]
				return: [CXString!]
			]

			constructUSR_ObjCCategory: "clang_constructUSR_ObjCCategory" [
				class_name [void-ptr!]
				category_name [void-ptr!]
				return: [CXString!]
			]

			constructUSR_ObjCProtocol: "clang_constructUSR_ObjCProtocol" [
				protocol_name [void-ptr!]
				return: [CXString!]
			]

			constructUSR_ObjCIvar: "clang_constructUSR_ObjCIvar" [
				name [void-ptr!]
				classUSR [CXString!]
				return: [CXString!]
			]

			constructUSR_ObjCMethod: "clang_constructUSR_ObjCMethod" [
				name [void-ptr!]
				isInstanceMethod [uint32!]
				classUSR [CXString!]
				return: [CXString!]
			]

			constructUSR_ObjCProperty: "clang_constructUSR_ObjCProperty" [
				property [void-ptr!]
				classUSR [CXString!]
				return: [CXString!]
			]

			getCursorSpelling: "clang_getCursorSpelling" [
				arg1 [CXCursor!]
				return: [CXString!]
			]

			Cursor_getSpellingNameRange: "clang_Cursor_getSpellingNameRange" [
				arg1 [CXCursor!]
				pieceIndex [uint32!]
				options [uint32!]
				return: [CXSourceRange!]
			]

			getCursorDisplayName: "clang_getCursorDisplayName" [
				arg1 [CXCursor!]
				return: [CXString!]
			]

			getCursorReferenced: "clang_getCursorReferenced" [
				arg1 [CXCursor!]
				return: [CXCursor!]
			]

			getCursorDefinition: "clang_getCursorDefinition" [
				arg1 [CXCursor!]
				return: [CXCursor!]
			]

			isCursorDefinition: "clang_isCursorDefinition" [
				arg1 [CXCursor!]
				return: [uint32!]
			]

			getCanonicalCursor: "clang_getCanonicalCursor" [
				arg1 [CXCursor!]
				return: [CXCursor!]
			]

			Cursor_getObjCSelectorIndex: "clang_Cursor_getObjCSelectorIndex" [
				arg1 [CXCursor!]
				return: [int32!]
			]

			Cursor_isDynamicCall: "clang_Cursor_isDynamicCall" [
				C [CXCursor!]
				return: [int32!]
			]

			Cursor_getReceiverType: "clang_Cursor_getReceiverType" [
				C [CXCursor!]
				return: [CXType!]
			]

			Cursor_getObjCPropertyAttributes: "clang_Cursor_getObjCPropertyAttributes" [
				C [CXCursor!]
				reserved [uint32!]
				return: [uint32!]
			]

			Cursor_getObjCDeclQualifiers: "clang_Cursor_getObjCDeclQualifiers" [
				C [CXCursor!]
				return: [uint32!]
			]

			Cursor_isObjCOptional: "clang_Cursor_isObjCOptional" [
				C [CXCursor!]
				return: [uint32!]
			]

			Cursor_isVariadic: "clang_Cursor_isVariadic" [
				C [CXCursor!]
				return: [uint32!]
			]

			Cursor_getCommentRange: "clang_Cursor_getCommentRange" [
				C [CXCursor!]
				return: [CXSourceRange!]
			]

			Cursor_getRawCommentText: "clang_Cursor_getRawCommentText" [
				C [CXCursor!]
				return: [CXString!]
			]

			Cursor_getBriefCommentText: "clang_Cursor_getBriefCommentText" [
				C [CXCursor!]
				return: [CXString!]
			]

			Cursor_getModule: "clang_Cursor_getModule" [
				C [CXCursor!]
				return: [void-ptr!]
			]

			getModuleForFile: "clang_getModuleForFile" [
				arg1 [void-ptr!]
				arg2 [void-ptr!]
				return: [void-ptr!]
			]

			Module_getASTFile: "clang_Module_getASTFile" [
				Module [void-ptr!]
				return: [void-ptr!]
			]

			Module_getParent: "clang_Module_getParent" [
				Module [void-ptr!]
				return: [void-ptr!]
			]

			Module_getName: "clang_Module_getName" [
				Module [void-ptr!]
				return: [CXString!]
			]

			Module_getFullName: "clang_Module_getFullName" [
				Module [void-ptr!]
				return: [CXString!]
			]

			Module_isSystem: "clang_Module_isSystem" [
				Module [void-ptr!]
				return: [int32!]
			]

			Module_getNumTopLevelHeaders: "clang_Module_getNumTopLevelHeaders" [
				arg1 [void-ptr!]
				Module [void-ptr!]
				return: [uint32!]
			]

			Module_getTopLevelHeader: "clang_Module_getNumTopLevelHeaders" [
				arg1 [void-ptr!]
				Module [void-ptr!]
				Index [uint32!]
				return: [void-ptr!]
			]

			CXXMethod_isPureVirtual: "clang_CXXMethod_isPureVirtual" [
				C [CXCursor!]
				return: [uint32!]
			]

			CXXMethod_isStatic: "clang_CXXMethod_isStatic" [
				C [CXCursor!]
				return: [uint32!]
			]

			CXXMethod_isVirtual: "clang_CXXMethod_isVirtual" [
				C [CXCursor!]
				return: [uint32!]
			]

			CXXMethod_isConst: "clang_CXXMethod_isConst" [
				C [CXCursor!]
				return: [uint32!]
			]

			getTemplateCursorKind: "clang_getTemplateCursorKind" [
				C [CXCursor!]
				return: [int32!]
			]

			getSpecializedCursorTemplate: "clang_getSpecializedCursorTemplate" [
				C [CXCursor!]
				return: [CXCursor!]
			]

			getCursorReferenceNameRange: "clang_getCursorReferenceNameRange" [
				C [CXCursor!]
				NameFlags [uint32!]
				PieceIndex [uint32!]
				return: [CXSourceRange!]
			]

			getTokenKind: "clang_getTokenKind" [
				arg1 [CXToken!]
				return: [int32!]
			]

			getTokenSpelling: "clang_getTokenSpelling" [
				arg1 [void-ptr!]
				arg2 [CXToken!]
				return: [CXString!]
			]

			getTokenLocation: "clang_getTokenLocation" [
				arg1 [void-ptr!]
				arg2 [CXToken!]
				return: [CXSourceLocation!]
			]

			getTokenExtent: "clang_getTokenExtent" [
				arg1 [void-ptr!]
				arg2 [CXToken!]
				return: [CXSourceRange!]
			]

			tokenize: "clang_tokenize" [
				TU [void-ptr!]
				Range [CXSourceRange!]
				Tokens [void-ptr!]
				NumTokens [void-ptr!]
			]

			annotateTokens: "clang_annotateTokens" [
				TU [void-ptr!]
				Tokens [void-ptr!]
				NumTokens [uint32!]
				Cursors [void-ptr!]
			]

			disposeTokens: "clang_disposeTokens" [
				TU [void-ptr!]
				Tokens [void-ptr!]
				NumTokens [uint32!]
			]

			getCursorKindSpelling: "clang_getCursorKindSpelling" [
				Kind [int32!]
				return: [CXString!]
			]

			getDefinitionSpellingAndExtent: "clang_getDefinitionSpellingAndExtent" [
				arg1 [CXCursor!]
				startBuf [void-ptr!]
				endBuf [void-ptr!]
				startLine [void-ptr!]
				startColumn [void-ptr!]
				endLine [void-ptr!]
				endColumn [void-ptr!]
			]

			enableStackTraces: "clang_enableStackTraces" [
			]

			executeOnThread: "clang_executeOnThread" [
				fn [void-ptr!]
				user_data [void-ptr!]
				stack_size [uint32!]
			]

			getCompletionChunkKind: "clang_getCompletionChunkKind" [
				completion_string [void-ptr!]
				chunk_number [uint32!]
				return: [int32!]
			]

			getCompletionChunkText: "clang_getCompletionChunkText" [
				completion_string [void-ptr!]
				chunk_number [uint32!]
				return: [CXString!]
			]

			getCompletionChunkCompletionString: "clang_getCompletionChunkCompletionString" [
				completion_string [void-ptr!]
				chunk_number [uint32!]
				return: [void-ptr!]
			]

			getNumCompletionChunks: "clang_getNumCompletionChunks" [
				completion_string [void-ptr!]
				return: [uint32!]
			]

			getCompletionPriority: "clang_getCompletionPriority" [
				completion_string [void-ptr!]
				return: [uint32!]
			]

			getCompletionAvailability: "clang_getCompletionAvailability" [
				completion_string [void-ptr!]
				return: [int32!]
			]

			getCompletionNumAnnotations: "clang_getCompletionNumAnnotations" [
				completion_string [void-ptr!]
				return: [uint32!]
			]

			getCompletionAnnotation: "clang_getCompletionAnnotation" [
				completion_string [void-ptr!]
				annotation_number [uint32!]
				return: [CXString!]
			]

			getCompletionParent: "clang_getCompletionParent" [
				completion_string [void-ptr!]
				kind [void-ptr!]
				return: [CXString!]
			]

			getCompletionBriefComment: "clang_getCompletionBriefComment" [
				completion_string [void-ptr!]
				return: [CXString!]
			]

			getCursorCompletionString: "clang_getCursorCompletionString" [
				cursor [CXCursor!]
				return: [void-ptr!]
			]

			defaultCodeCompleteOptions: "clang_defaultCodeCompleteOptions" [
				return: [uint32!]
			]

			codeCompleteAt: "clang_codeCompleteAt" [
				TU [void-ptr!]
				complete_filename [void-ptr!]
				complete_line [uint32!]
				complete_column [uint32!]
				unsaved_files [void-ptr!]
				num_unsaved_files [uint32!]
				options [uint32!]
				return: [void-ptr!]
			]

			sortCodeCompletionResults: "clang_sortCodeCompletionResults" [
				Results [void-ptr!]
				NumResults [uint32!]
			]

			disposeCodeCompleteResults: "clang_disposeCodeCompleteResults" [
				Results [void-ptr!]
			]

			codeCompleteGetNumDiagnostics: "clang_codeCompleteGetNumDiagnostics" [
				Results [void-ptr!]
				return: [uint32!]
			]

			codeCompleteGetDiagnostic: "clang_codeCompleteGetDiagnostic" [
				Results [void-ptr!]
				Index [uint32!]
				return: [void-ptr!]
			]

			codeCompleteGetContexts: "clang_codeCompleteGetContexts" [
				Results [void-ptr!]
				return: [uint64!]
			]

			codeCompleteGetContainerKind: "clang_codeCompleteGetContainerKind" [
				Results [void-ptr!]
				IsIncomplete [void-ptr!]
				return: [int32!]
			]

			codeCompleteGetContainerUSR: "clang_codeCompleteGetContainerUSR" [
				Results [void-ptr!]
				return: [CXString!]
			]

			codeCompleteGetObjCSelector: "clang_codeCompleteGetObjCSelector" [
				Results [void-ptr!]
				return: [CXString!]
			]

			getClangVersion: "clang_getClangVersion" [
				return: [CXString!]
			]

			toggleCrashRecovery: "clang_toggleCrashRecovery" [
				isEnabled [uint32!]
			]

			getInclusions: "clang_getInclusions" [
				tu [void-ptr!]
				visitor [void-ptr!]
				client_data [void-ptr!]
			]

			getRemappings: "clang_getRemappings" [
				path [void-ptr!]
				return: [void-ptr!]
			]

			getRemappingsFromFileList: "clang_getRemappingsFromFileList" [
				filePaths [void-ptr!]
				numFiles [uint32!]
				return: [void-ptr!]
			]

			remap_getNumFiles: "clang_remap_getNumFiles" [
				arg1 [void-ptr!]
				return: [uint32!]
			]

			remap_getFilenames: "clang_remap_getFilenames" [
				arg1 [void-ptr!]
				index [uint32!]
				original [void-ptr!]
				transformed [void-ptr!]
			]

			remap_dispose: "clang_remap_dispose" [
				arg1 [void-ptr!]
			]

			findReferencesInFile: "clang_findReferencesInFile" [
				cursor [CXCursor!]
				file [void-ptr!]
				visitor [CXCursorAndRangeVisitor!]
				return: [int32!]
			]

			findIncludesInFile: "clang_findIncludesInFile" [
				TU [void-ptr!]
				file [void-ptr!]
				visitor [CXCursorAndRangeVisitor!]
				return: [int32!]
			]

			index_isEntityObjCContainerKind: "clang_index_isEntityObjCContainerKind" [
				arg1 [int32!]
				return: [int32!]
			]

			index_getObjCContainerDeclInfo: "clang_index_getObjCContainerDeclInfo" [
				arg1 [void-ptr!]
				return: [void-ptr!]
			]

			index_getObjCInterfaceDeclInfo: "clang_index_getObjCInterfaceDeclInfo" [
				arg1 [void-ptr!]
				return: [void-ptr!]
			]

			index_getObjCCategoryDeclInfo: "clang_index_getObjCCategoryDeclInfo" [
				arg1 [void-ptr!]
				return: [void-ptr!]
			]

			index_getObjCProtocolRefListInfo: "clang_index_getObjCProtocolRefListInfo" [
				arg1 [void-ptr!]
				return: [void-ptr!]
			]

			index_getObjCPropertyDeclInfo: "clang_index_getObjCPropertyDeclInfo" [
				arg1 [void-ptr!]
				return: [void-ptr!]
			]

			index_getIBOutletCollectionAttrInfo: "clang_index_getIBOutletCollectionAttrInfo" [
				arg1 [void-ptr!]
				return: [void-ptr!]
			]

			index_getCXXClassDeclInfo: "clang_index_getCXXClassDeclInfo" [
				arg1 [void-ptr!]
				return: [void-ptr!]
			]

			index_getClientContainer: "clang_index_getClientContainer" [
				arg1 [void-ptr!]
				return: [void-ptr!]
			]

			index_setClientContainer: "clang_index_setClientContainer" [
				arg1 [void-ptr!]
				arg2 [void-ptr!]
			]

			index_getClientEntity: "clang_index_getClientEntity" [
				arg1 [void-ptr!]
				return: [void-ptr!]
			]

			index_setClientEntity: "clang_index_setClientEntity" [
				arg1 [void-ptr!]
				arg2 [void-ptr!]
			]

			IndexAction_create: "clang_IndexAction_create" [
				CIdx [void-ptr!]
				return: [void-ptr!]
			]

			IndexAction_dispose: "clang_IndexAction_dispose" [
				arg1 [void-ptr!]
			]

			indexSourceFile: "clang_indexSourceFile" [
				arg1 [void-ptr!]
				client_data [void-ptr!]
				index_callbacks [void-ptr!]
				index_callbacks_size [uint32!]
				index_options [uint32!]
				source_filename [void-ptr!]
				command_line_args [void-ptr!]
				num_command_line_args [int32!]
				unsaved_files [void-ptr!]
				num_unsaved_files [uint32!]
				out_TU [void-ptr!]
				TU_options [uint32!]
				return: [int32!]
			]

			indexTranslationUnit: "clang_indexTranslationUnit" [
				arg1 [void-ptr!]
				client_data [void-ptr!]
				index_callbacks [void-ptr!]
				index_callbacks_size [uint32!]
				index_options [uint32!]
				arg6 [void-ptr!]
				return: [int32!]
			]

			indexLoc_getFileLocation: "clang_indexLoc_getFileLocation" [
				loc [CXIdxLoc!]
				indexFile [void-ptr!]
				file [void-ptr!]
				line [void-ptr!]
				column [void-ptr!]
				offset [void-ptr!]
			]

			indexLoc_getCXSourceLocation: "clang_indexLoc_getCXSourceLocation" [
				loc [CXIdxLoc!]
				return: [CXSourceLocation!]
			]

			Cursor_getParsedComment: "clang_Cursor_getParsedComment" [
				C [CXCursor!]
				return: [CXComment!]
			]

			Comment_getKind: "clang_Comment_getKind" [
				Comment [CXComment!]
				return: [int32!]
			]

			Comment_getNumChildren: "clang_Comment_getNumChildren" [
				Comment [CXComment!]
				return: [uint32!]
			]

			Comment_getChild: "clang_Comment_getChild" [
				Comment [CXComment!]
				ChildIdx [uint32!]
				return: [CXComment!]
			]

			Comment_isWhitespace: "clang_Comment_isWhitespace" [
				Comment [CXComment!]
				return: [uint32!]
			]

			InlineContentComment_hasTrailingNewline: "clang_InlineContentComment_hasTrailingNewline" [
				Comment [CXComment!]
				return: [uint32!]
			]

			TextComment_getText: "clang_TextComment_getText" [
				Comment [CXComment!]
				return: [CXString!]
			]

			InlineCommandComment_getCommandName: "clang_InlineCommandComment_getCommandName" [
				Comment [CXComment!]
				return: [CXString!]
			]

			InlineCommandComment_getRenderKind: "clang_InlineCommandComment_getRenderKind" [
				Comment [CXComment!]
				return: [int32!]
			]

			InlineCommandComment_getNumArgs: "clang_InlineCommandComment_getNumArgs" [
				Comment [CXComment!]
				return: [uint32!]
			]

			InlineCommandComment_getArgText: "clang_InlineCommandComment_getArgText" [
				Comment [CXComment!]
				ArgIdx [uint32!]
				return: [CXString!]
			]

			HTMLTagComment_getTagName: "clang_HTMLTagComment_getTagName" [
				Comment [CXComment!]
				return: [CXString!]
			]

			HTMLStartTagComment_isSelfClosing: "clang_HTMLStartTagComment_isSelfClosing" [
				Comment [CXComment!]
				return: [uint32!]
			]

			HTMLStartTag_getNumAttrs: "clang_HTMLStartTag_getNumAttrs" [
				Comment [CXComment!]
				return: [uint32!]
			]

			HTMLStartTag_getAttrName: "clang_HTMLStartTag_getAttrName" [
				Comment [CXComment!]
				AttrIdx [uint32!]
				return: [CXString!]
			]

			HTMLStartTag_getAttrValue: "clang_HTMLStartTag_getAttrValue" [
				Comment [CXComment!]
				AttrIdx [uint32!]
				return: [CXString!]
			]

			BlockCommandComment_getCommandName: "clang_BlockCommandComment_getCommandName" [
				Comment [CXComment!]
				return: [CXString!]
			]

			BlockCommandComment_getNumArgs: "clang_BlockCommandComment_getNumArgs" [
				Comment [CXComment!]
				return: [uint32!]
			]

			BlockCommandComment_getArgText: "clang_BlockCommandComment_getArgText" [
				Comment [CXComment!]
				ArgIdx [uint32!]
				return: [CXString!]
			]

			BlockCommandComment_getParagraph: "clang_BlockCommandComment_getParagraph" [
				Comment [CXComment!]
				return: [CXComment!]
			]

			ParamCommandComment_getParamName: "clang_ParamCommandComment_getParamName" [
				Comment [CXComment!]
				return: [CXString!]
			]

			ParamCommandComment_isParamIndexValid: "clang_ParamCommandComment_isParamIndexValid" [
				Comment [CXComment!]
				return: [uint32!]
			]

			ParamCommandComment_getParamIndex: "clang_ParamCommandComment_getParamIndex" [
				Comment [CXComment!]
				return: [uint32!]
			]

			ParamCommandComment_isDirectionExplicit: "clang_ParamCommandComment_isDirectionExplicit" [
				Comment [CXComment!]
				return: [uint32!]
			]

			ParamCommandComment_getDirection: "clang_ParamCommandComment_getDirection" [
				Comment [CXComment!]
				return: [int32!]
			]

			TParamCommandComment_getParamName: "clang_TParamCommandComment_getParamName" [
				Comment [CXComment!]
				return: [CXString!]
			]

			TParamCommandComment_isParamPositionValid: "clang_TParamCommandComment_isParamPositionValid" [
				Comment [CXComment!]
				return: [uint32!]
			]

			TParamCommandComment_getDepth: "clang_TParamCommandComment_getDepth" [
				Comment [CXComment!]
				return: [uint32!]
			]

			TParamCommandComment_getIndex: "clang_TParamCommandComment_getIndex" [
				Comment [CXComment!]
				Depth [uint32!]
				return: [uint32!]
			]

			VerbatimBlockLineComment_getText: "clang_VerbatimBlockLineComment_getText" [
				Comment [CXComment!]
				return: [CXString!]
			]

			VerbatimLineComment_getText: "clang_VerbatimLineComment_getText" [
				Comment [CXComment!]
				return: [CXString!]
			]

			HTMLTagComment_getAsString: "clang_HTMLTagComment_getAsString" [
				Comment [CXComment!]
				return: [CXString!]
			]

			FullComment_getAsHTML: "clang_FullComment_getAsHTML" [
				Comment [CXComment!]
				return: [CXString!]
			]

			FullComment_getAsXML: "clang_FullComment_getAsXML" [
				Comment [CXComment!]
				return: [CXString!]
			]
		]
	]
]
