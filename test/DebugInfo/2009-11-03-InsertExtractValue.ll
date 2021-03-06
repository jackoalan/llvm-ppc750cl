; RUN: llvm-as < %s | llvm-dis | FileCheck %s

!llvm.dbg.sp = !{!0}
!llvm.dbg.cu = !{!5}
!llvm.module.flags = !{!6}

!0 = !MDSubprogram(name: "bar", linkageName: "_ZN3foo3barEv", line: 3, isLocal: false, isDefinition: false, virtualIndex: 6, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: false, scopeLine: 3, file: !4, scope: !1, type: !2)
!1 = !MDFile(filename: "/foo", directory: "bar.cpp")
!2 = !MDSubroutineType(types: !3)
!3 = !{null}
!4 = !MDFile(filename: "/foo", directory: "bar.cpp")
!5 = !MDCompileUnit(language: DW_LANG_C99, isOptimized: true, emissionKind: 0, file: !4, enums: !{}, retainedTypes: !{})

define <{i32, i32}> @f1() {
; CHECK: !dbgx ![[NUMBER:[0-9]+]]
  %r = insertvalue <{ i32, i32 }> zeroinitializer, i32 4, 1, !dbgx !1
; CHECK: !dbgx ![[NUMBER]]
  %e = extractvalue <{ i32, i32 }> %r, 0, !dbgx !1
  ret <{ i32, i32 }> %r
}

; CHECK: DIFlagProtected
!6 = !{i32 1, !"Debug Info Version", i32 3}
