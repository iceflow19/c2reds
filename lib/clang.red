Red []

#system-global [
	#include %clang.reds
]

make object! [

	enum: [
		CXErrorCode: [
			CXError_Success 0
			CXError_Failure 1
			CXError_Crashed 2
			CXError_InvalidArguments 3
			CXError_ASTReadError 4
		]

		CXAvailabilityKind: [
			CXAvailability_Available 0
			CXAvailability_Deprecated 1
			CXAvailability_NotAvailable 2
			CXAvailability_NotAccessible 3
		]

		CXGlobalOptFlags: [
			CXGlobalOpt_None 0
			CXGlobalOpt_ThreadBackgroundPriorityForIndexing 1
			CXGlobalOpt_ThreadBackgroundPriorityForEditing 2
			CXGlobalOpt_ThreadBackgroundPriorityForAll 3
		]

		CXDiagnosticSeverity: [
			CXDiagnostic_Ignored 0
			CXDiagnostic_Note 1
			CXDiagnostic_Warning 2
			CXDiagnostic_Error 3
			CXDiagnostic_Fatal 4
		]

		CXLoadDiag_Error: [
			CXLoadDiag_None 0
			CXLoadDiag_Unknown 1
			CXLoadDiag_CannotLoad 2
			CXLoadDiag_InvalidFile 3
		]

		CXDiagnosticDisplayOptions: [
			CXDiagnostic_DisplaySourceLocation 1
			CXDiagnostic_DisplayColumn 2
			CXDiagnostic_DisplaySourceRanges 4
			CXDiagnostic_DisplayOption 8
			CXDiagnostic_DisplayCategoryId 16
			CXDiagnostic_DisplayCategoryName 32
		]

		CXTranslationUnit_Flags: [
			CXTranslationUnit_None 0
			CXTranslationUnit_DetailedPreprocessingRecord 1
			CXTranslationUnit_Incomplete 2
			CXTranslationUnit_PrecompiledPreamble 4
			CXTranslationUnit_CacheCompletionResults 8
			CXTranslationUnit_ForSerialization 16
			CXTranslationUnit_CXXChainedPCH 32
			CXTranslationUnit_SkipFunctionBodies 64
			CXTranslationUnit_IncludeBriefCommentsInCodeCompletion 128
		]

		CXSaveTranslationUnit_Flags: [
			CXSaveTranslationUnit_None 0
		]

		CXSaveError: [
			CXSaveError_None 0
			CXSaveError_Unknown 1
			CXSaveError_TranslationErrors 2
			CXSaveError_InvalidTU 3
		]

		CXReparse_Flags: [
			CXReparse_None 0
		]

		CXTUResourceUsageKind: [
			CXTUResourceUsage_AST 1
			CXTUResourceUsage_Identifiers 2
			CXTUResourceUsage_Selectors 3
			CXTUResourceUsage_GlobalCompletionResults 4
			CXTUResourceUsage_SourceManagerContentCache 5
			CXTUResourceUsage_AST_SideTables 6
			CXTUResourceUsage_SourceManager_Membuffer_Malloc 7
			CXTUResourceUsage_SourceManager_Membuffer_MMap 8
			CXTUResourceUsage_ExternalASTSource_Membuffer_Malloc 9
			CXTUResourceUsage_ExternalASTSource_Membuffer_MMap 10
			CXTUResourceUsage_Preprocessor 11
			CXTUResourceUsage_PreprocessingRecord 12
			CXTUResourceUsage_SourceManager_DataStructures 13
			CXTUResourceUsage_Preprocessor_HeaderSearch 14
			CXTUResourceUsage_MEMORY_IN_BYTES_BEGIN 1
			CXTUResourceUsage_MEMORY_IN_BYTES_END 14
			CXTUResourceUsage_First 1
			CXTUResourceUsage_Last 14
		]

		CXCursorKind: [
			CXCursor_UnexposedDecl 1
			CXCursor_StructDecl 2
			CXCursor_UnionDecl 3
			CXCursor_ClassDecl 4
			CXCursor_EnumDecl 5
			CXCursor_FieldDecl 6
			CXCursor_EnumConstantDecl 7
			CXCursor_FunctionDecl 8
			CXCursor_VarDecl 9
			CXCursor_ParmDecl 10
			CXCursor_ObjCInterfaceDecl 11
			CXCursor_ObjCCategoryDecl 12
			CXCursor_ObjCProtocolDecl 13
			CXCursor_ObjCPropertyDecl 14
			CXCursor_ObjCIvarDecl 15
			CXCursor_ObjCInstanceMethodDecl 16
			CXCursor_ObjCClassMethodDecl 17
			CXCursor_ObjCImplementationDecl 18
			CXCursor_ObjCCategoryImplDecl 19
			CXCursor_TypedefDecl 20
			CXCursor_CXXMethod 21
			CXCursor_Namespace 22
			CXCursor_LinkageSpec 23
			CXCursor_Constructor 24
			CXCursor_Destructor 25
			CXCursor_ConversionFunction 26
			CXCursor_TemplateTypeParameter 27
			CXCursor_NonTypeTemplateParameter 28
			CXCursor_TemplateTemplateParameter 29
			CXCursor_FunctionTemplate 30
			CXCursor_ClassTemplate 31
			CXCursor_ClassTemplatePartialSpecialization 32
			CXCursor_NamespaceAlias 33
			CXCursor_UsingDirective 34
			CXCursor_UsingDeclaration 35
			CXCursor_TypeAliasDecl 36
			CXCursor_ObjCSynthesizeDecl 37
			CXCursor_ObjCDynamicDecl 38
			CXCursor_CXXAccessSpecifier 39
			CXCursor_FirstDecl 1
			CXCursor_LastDecl 39
			CXCursor_FirstRef 40
			CXCursor_ObjCSuperClassRef 40
			CXCursor_ObjCProtocolRef 41
			CXCursor_ObjCClassRef 42
			CXCursor_TypeRef 43
			CXCursor_CXXBaseSpecifier 44
			CXCursor_TemplateRef 45
			CXCursor_NamespaceRef 46
			CXCursor_MemberRef 47
			CXCursor_LabelRef 48
			CXCursor_OverloadedDeclRef 49
			CXCursor_VariableRef 50
			CXCursor_LastRef 50
			CXCursor_FirstInvalid 70
			CXCursor_InvalidFile 70
			CXCursor_NoDeclFound 71
			CXCursor_NotImplemented 72
			CXCursor_InvalidCode 73
			CXCursor_LastInvalid 73
			CXCursor_FirstExpr 100
			CXCursor_UnexposedExpr 100
			CXCursor_DeclRefExpr 101
			CXCursor_MemberRefExpr 102
			CXCursor_CallExpr 103
			CXCursor_ObjCMessageExpr 104
			CXCursor_BlockExpr 105
			CXCursor_IntegerLiteral 106
			CXCursor_FloatingLiteral 107
			CXCursor_ImaginaryLiteral 108
			CXCursor_StringLiteral 109
			CXCursor_CharacterLiteral 110
			CXCursor_ParenExpr 111
			CXCursor_UnaryOperator 112
			CXCursor_ArraySubscriptExpr 113
			CXCursor_BinaryOperator 114
			CXCursor_CompoundAssignOperator 115
			CXCursor_ConditionalOperator 116
			CXCursor_CStyleCastExpr 117
			CXCursor_CompoundLiteralExpr 118
			CXCursor_InitListExpr 119
			CXCursor_AddrLabelExpr 120
			CXCursor_StmtExpr 121
			CXCursor_GenericSelectionExpr 122
			CXCursor_GNUNullExpr 123
			CXCursor_CXXStaticCastExpr 124
			CXCursor_CXXDynamicCastExpr 125
			CXCursor_CXXReinterpretCastExpr 126
			CXCursor_CXXConstCastExpr 127
			CXCursor_CXXFunctionalCastExpr 128
			CXCursor_CXXTypeidExpr 129
			CXCursor_CXXBoolLiteralExpr 130
			CXCursor_CXXNullPtrLiteralExpr 131
			CXCursor_CXXThisExpr 132
			CXCursor_CXXThrowExpr 133
			CXCursor_CXXNewExpr 134
			CXCursor_CXXDeleteExpr 135
			CXCursor_UnaryExpr 136
			CXCursor_ObjCStringLiteral 137
			CXCursor_ObjCEncodeExpr 138
			CXCursor_ObjCSelectorExpr 139
			CXCursor_ObjCProtocolExpr 140
			CXCursor_ObjCBridgedCastExpr 141
			CXCursor_PackExpansionExpr 142
			CXCursor_SizeOfPackExpr 143
			CXCursor_LambdaExpr 144
			CXCursor_ObjCBoolLiteralExpr 145
			CXCursor_ObjCSelfExpr 146
			CXCursor_LastExpr 146
			CXCursor_FirstStmt 200
			CXCursor_UnexposedStmt 200
			CXCursor_LabelStmt 201
			CXCursor_CompoundStmt 202
			CXCursor_CaseStmt 203
			CXCursor_DefaultStmt 204
			CXCursor_IfStmt 205
			CXCursor_SwitchStmt 206
			CXCursor_WhileStmt 207
			CXCursor_DoStmt 208
			CXCursor_ForStmt 209
			CXCursor_GotoStmt 210
			CXCursor_IndirectGotoStmt 211
			CXCursor_ContinueStmt 212
			CXCursor_BreakStmt 213
			CXCursor_ReturnStmt 214
			CXCursor_GCCAsmStmt 215
			CXCursor_AsmStmt 215
			CXCursor_ObjCAtTryStmt 216
			CXCursor_ObjCAtCatchStmt 217
			CXCursor_ObjCAtFinallyStmt 218
			CXCursor_ObjCAtThrowStmt 219
			CXCursor_ObjCAtSynchronizedStmt 220
			CXCursor_ObjCAutoreleasePoolStmt 221
			CXCursor_ObjCForCollectionStmt 222
			CXCursor_CXXCatchStmt 223
			CXCursor_CXXTryStmt 224
			CXCursor_CXXForRangeStmt 225
			CXCursor_SEHTryStmt 226
			CXCursor_SEHExceptStmt 227
			CXCursor_SEHFinallyStmt 228
			CXCursor_MSAsmStmt 229
			CXCursor_NullStmt 230
			CXCursor_DeclStmt 231
			CXCursor_OMPParallelDirective 232
			CXCursor_OMPSimdDirective 233
			CXCursor_OMPForDirective 234
			CXCursor_OMPSectionsDirective 235
			CXCursor_OMPSectionDirective 236
			CXCursor_OMPSingleDirective 237
			CXCursor_OMPParallelForDirective 238
			CXCursor_OMPParallelSectionsDirective 239
			CXCursor_OMPTaskDirective 240
			CXCursor_OMPMasterDirective 241
			CXCursor_OMPCriticalDirective 242
			CXCursor_OMPTaskyieldDirective 243
			CXCursor_OMPBarrierDirective 244
			CXCursor_OMPTaskwaitDirective 245
			CXCursor_OMPFlushDirective 246
			CXCursor_SEHLeaveStmt 247
			CXCursor_LastStmt 247
			CXCursor_TranslationUnit 300
			CXCursor_FirstAttr 400
			CXCursor_UnexposedAttr 400
			CXCursor_IBActionAttr 401
			CXCursor_IBOutletAttr 402
			CXCursor_IBOutletCollectionAttr 403
			CXCursor_CXXFinalAttr 404
			CXCursor_CXXOverrideAttr 405
			CXCursor_AnnotateAttr 406
			CXCursor_AsmLabelAttr 407
			CXCursor_PackedAttr 408
			CXCursor_PureAttr 409
			CXCursor_ConstAttr 410
			CXCursor_NoDuplicateAttr 411
			CXCursor_CUDAConstantAttr 412
			CXCursor_CUDADeviceAttr 413
			CXCursor_CUDAGlobalAttr 414
			CXCursor_CUDAHostAttr 415
			CXCursor_LastAttr 415
			CXCursor_PreprocessingDirective 500
			CXCursor_MacroDefinition 501
			CXCursor_MacroExpansion 502
			CXCursor_MacroInstantiation 502
			CXCursor_InclusionDirective 503
			CXCursor_FirstPreprocessing 500
			CXCursor_LastPreprocessing 503
			CXCursor_ModuleImportDecl 600
			CXCursor_FirstExtraDecl 600
			CXCursor_LastExtraDecl 600
		]

		CXLinkageKind: [
			CXLinkage_Invalid 0
			CXLinkage_NoLinkage 1
			CXLinkage_Internal 2
			CXLinkage_UniqueExternal 3
			CXLinkage_External 4
		]

		CXLanguageKind: [
			CXLanguage_Invalid 0
			CXLanguage_C 1
			CXLanguage_ObjC 2
			CXLanguage_CPlusPlus 3
		]

		CXTypeKind: [
			CXType_Invalid 0
			CXType_Unexposed 1
			CXType_Void 2
			CXType_Bool 3
			CXType_Char_U 4
			CXType_UChar 5
			CXType_Char16 6
			CXType_Char32 7
			CXType_UShort 8
			CXType_UInt 9
			CXType_ULong 10
			CXType_ULongLong 11
			CXType_UInt128 12
			CXType_Char_S 13
			CXType_SChar 14
			CXType_WChar 15
			CXType_Short 16
			CXType_Int 17
			CXType_Long 18
			CXType_LongLong 19
			CXType_Int128 20
			CXType_Float 21
			CXType_Double 22
			CXType_LongDouble 23
			CXType_NullPtr 24
			CXType_Overload 25
			CXType_Dependent 26
			CXType_ObjCId 27
			CXType_ObjCClass 28
			CXType_ObjCSel 29
			CXType_FirstBuiltin 2
			CXType_LastBuiltin 29
			CXType_Complex 100
			CXType_Pointer 101
			CXType_BlockPointer 102
			CXType_LValueReference 103
			CXType_RValueReference 104
			CXType_Record 105
			CXType_Enum 106
			CXType_Typedef 107
			CXType_ObjCInterface 108
			CXType_ObjCObjectPointer 109
			CXType_FunctionNoProto 110
			CXType_FunctionProto 111
			CXType_ConstantArray 112
			CXType_Vector 113
			CXType_IncompleteArray 114
			CXType_VariableArray 115
			CXType_DependentSizedArray 116
			CXType_MemberPointer 117
		]

		CXCallingConv: [
			CXCallingConv_Default 0
			CXCallingConv_C 1
			CXCallingConv_X86StdCall 2
			CXCallingConv_X86FastCall 3
			CXCallingConv_X86ThisCall 4
			CXCallingConv_X86Pascal 5
			CXCallingConv_AAPCS 6
			CXCallingConv_AAPCS_VFP 7
			CXCallingConv_PnaclCall 8
			CXCallingConv_IntelOclBicc 9
			CXCallingConv_X86_64Win64 10
			CXCallingConv_X86_64SysV 11
			CXCallingConv_Invalid 100
			CXCallingConv_Unexposed 200
		]

		CXTypeLayoutError: [
			CXTypeLayoutError_Invalid -1
			CXTypeLayoutError_Incomplete -2
			CXTypeLayoutError_Dependent -3
			CXTypeLayoutError_NotConstantSize -4
			CXTypeLayoutError_InvalidFieldName -5
		]

		CXRefQualifierKind: [
			CXRefQualifier_None 0
			CXRefQualifier_LValue 1
			CXRefQualifier_RValue 2
		]

		CX_CXXAccessSpecifier: [
			CX_CXXInvalidAccessSpecifier 0
			CX_CXXPublic 1
			CX_CXXProtected 2
			CX_CXXPrivate 3
		]

		CXChildVisitResult: [
			CXChildVisit_Break 0
			CXChildVisit_Continue 1
			CXChildVisit_Recurse 2
		]

		CXCursorVisitor: [
			CXChildVisit_Break 0
			CXChildVisit_Continue 1
			CXChildVisit_Recurse 2
		]

		CXObjCPropertyAttrKind: [
			CXObjCPropertyAttr_noattr 0
			CXObjCPropertyAttr_readonly 1
			CXObjCPropertyAttr_getter 2
			CXObjCPropertyAttr_assign 4
			CXObjCPropertyAttr_readwrite 8
			CXObjCPropertyAttr_retain 16
			CXObjCPropertyAttr_copy 32
			CXObjCPropertyAttr_nonatomic 64
			CXObjCPropertyAttr_setter 128
			CXObjCPropertyAttr_atomic 256
			CXObjCPropertyAttr_weak 512
			CXObjCPropertyAttr_strong 1024
			CXObjCPropertyAttr_unsafe_unretained 2048
		]

		CXObjCDeclQualifierKind: [
			CXObjCDeclQualifier_None 0
			CXObjCDeclQualifier_In 1
			CXObjCDeclQualifier_Inout 2
			CXObjCDeclQualifier_Out 4
			CXObjCDeclQualifier_Bycopy 8
			CXObjCDeclQualifier_Byref 16
			CXObjCDeclQualifier_Oneway 32
		]

		CXNameRefFlags: [
			CXNameRange_WantQualifier 1
			CXNameRange_WantTemplateArgs 2
			CXNameRange_WantSinglePiece 4
		]

		CXTokenKind: [
			CXToken_Punctuation 0
			CXToken_Keyword 1
			CXToken_Identifier 2
			CXToken_Literal 3
			CXToken_Comment 4
		]

		CXCompletionChunkKind: [
			CXCompletionChunk_Optional 0
			CXCompletionChunk_TypedText 1
			CXCompletionChunk_Text 2
			CXCompletionChunk_Placeholder 3
			CXCompletionChunk_Informative 4
			CXCompletionChunk_CurrentParameter 5
			CXCompletionChunk_LeftParen 6
			CXCompletionChunk_RightParen 7
			CXCompletionChunk_LeftBracket 8
			CXCompletionChunk_RightBracket 9
			CXCompletionChunk_LeftBrace 10
			CXCompletionChunk_RightBrace 11
			CXCompletionChunk_LeftAngle 12
			CXCompletionChunk_RightAngle 13
			CXCompletionChunk_Comma 14
			CXCompletionChunk_ResultType 15
			CXCompletionChunk_Colon 16
			CXCompletionChunk_SemiColon 17
			CXCompletionChunk_Equal 18
			CXCompletionChunk_HorizontalSpace 19
			CXCompletionChunk_VerticalSpace 20
		]

		CXCodeComplete_Flags: [
			CXCodeComplete_IncludeMacros 1
			CXCodeComplete_IncludeCodePatterns 2
			CXCodeComplete_IncludeBriefComments 4
		]

		CXCompletionContext: [
			CXCompletionContext_Unexposed 0
			CXCompletionContext_AnyType 1
			CXCompletionContext_AnyValue 2
			CXCompletionContext_ObjCObjectValue 4
			CXCompletionContext_ObjCSelectorValue 8
			CXCompletionContext_CXXClassTypeValue 16
			CXCompletionContext_DotMemberAccess 32
			CXCompletionContext_ArrowMemberAccess 64
			CXCompletionContext_ObjCPropertyAccess 128
			CXCompletionContext_EnumTag 256
			CXCompletionContext_UnionTag 512
			CXCompletionContext_StructTag 1024
			CXCompletionContext_ClassTag 2048
			CXCompletionContext_Namespace 4096
			CXCompletionContext_NestedNameSpecifier 8192
			CXCompletionContext_ObjCInterface 16384
			CXCompletionContext_ObjCProtocol 32768
			CXCompletionContext_ObjCCategory 65536
			CXCompletionContext_ObjCInstanceMessage 131072
			CXCompletionContext_ObjCClassMessage 262144
			CXCompletionContext_ObjCSelectorName 524288
			CXCompletionContext_MacroName 1048576
			CXCompletionContext_NaturalLanguage 2097152
			CXCompletionContext_Unknown 4194303
		]

		CXVisitorResult: [
			CXVisit_Break 0
			CXVisit_Continue 1
		]

		CXResult: [
			CXResult_Success 0
			CXResult_Invalid 1
			CXResult_VisitBreak 2
		]

		CXIdxEntityKind: [
			CXIdxEntity_Unexposed 0
			CXIdxEntity_Typedef 1
			CXIdxEntity_Function 2
			CXIdxEntity_Variable 3
			CXIdxEntity_Field 4
			CXIdxEntity_EnumConstant 5
			CXIdxEntity_ObjCClass 6
			CXIdxEntity_ObjCProtocol 7
			CXIdxEntity_ObjCCategory 8
			CXIdxEntity_ObjCInstanceMethod 9
			CXIdxEntity_ObjCClassMethod 10
			CXIdxEntity_ObjCProperty 11
			CXIdxEntity_ObjCIvar 12
			CXIdxEntity_Enum 13
			CXIdxEntity_Struct 14
			CXIdxEntity_Union 15
			CXIdxEntity_CXXClass 16
			CXIdxEntity_CXXNamespace 17
			CXIdxEntity_CXXNamespaceAlias 18
			CXIdxEntity_CXXStaticVariable 19
			CXIdxEntity_CXXStaticMethod 20
			CXIdxEntity_CXXInstanceMethod 21
			CXIdxEntity_CXXConstructor 22
			CXIdxEntity_CXXDestructor 23
			CXIdxEntity_CXXConversionFunction 24
			CXIdxEntity_CXXTypeAlias 25
			CXIdxEntity_CXXInterface 26
		]

		CXIdxEntityLanguage: [
			CXIdxEntityLang_None 0
			CXIdxEntityLang_C 1
			CXIdxEntityLang_ObjC 2
			CXIdxEntityLang_CXX 3
		]

		CXIdxEntityCXXTemplateKind: [
			CXIdxEntity_NonTemplate 0
			CXIdxEntity_Template 1
			CXIdxEntity_TemplatePartialSpecialization 2
			CXIdxEntity_TemplateSpecialization 3
		]

		CXIdxAttrKind: [
			CXIdxAttr_Unexposed 0
			CXIdxAttr_IBAction 1
			CXIdxAttr_IBOutlet 2
			CXIdxAttr_IBOutletCollection 3
		]

		CXIdxDeclInfoFlags: [
			CXIdxDeclFlag_Skipped 1
		]

		CXIdxObjCContainerKind: [
			CXIdxObjCContainer_ForwardRef 0
			CXIdxObjCContainer_Interface 1
			CXIdxObjCContainer_Implementation 2
		]

		CXIdxEntityRefKind: [
			CXIdxEntityRef_Direct 1
			CXIdxEntityRef_Implicit 2
		]

		CXIndexOptFlags: [
			CXIndexOpt_None 0
			CXIndexOpt_SuppressRedundantRefs 1
			CXIndexOpt_IndexFunctionLocalSymbols 2
			CXIndexOpt_IndexImplicitTemplateInstantiations 4
			CXIndexOpt_SuppressWarnings 8
			CXIndexOpt_SkipParsedBodiesInSession 16
		]

		CXCommentKind: [
			CXComment_Null 0
			CXComment_Text 1
			CXComment_InlineCommand 2
			CXComment_HTMLStartTag 3
			CXComment_HTMLEndTag 4
			CXComment_Paragraph 5
			CXComment_BlockCommand 6
			CXComment_ParamCommand 7
			CXComment_TParamCommand 8
			CXComment_VerbatimBlockCommand 9
			CXComment_VerbatimBlockLine 10
			CXComment_VerbatimLine 11
			CXComment_FullComment 12
		]

		CXCommentInlineCommandRenderKind: [
			CXCommentInlineCommandRenderKind_Normal 0
			CXCommentInlineCommandRenderKind_Bold 1
			CXCommentInlineCommandRenderKind_Monospaced 2
			CXCommentInlineCommandRenderKind_Emphasized 3
		]

		CXCommentParamPassDirection: [
			CXCommentParamPassDirection_In 0
			CXCommentParamPassDirection_Out 1
			CXCommentParamPassDirection_InOut 2
		]
	]
]
