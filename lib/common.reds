Red/System []

;==================================
; Common defines
;==================================

;Void Pointer
#define void-ptr! int-ptr!

;Integer Types
#define int32! integer!
#define uint32! integer!

;#define unit64! integer!
;#define int64! integer!

uint64!: alias struct! [
	higher [uint32!]
	lower  [uint32!]
]

int64!: alias struct! [
	higher [int32!]
	lower  [int32!]
]