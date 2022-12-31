%ifdef CONFIG
{
  "HostFeatures": ["AVX"],
  "RegData": {
    "XMM2": ["0xBFF0000000000000", "0x4008000000000000", "0x0000000000000000", "0x0000000000000000"],
    "XMM3": ["0xBFF0000000000000", "0x4008000000000000", "0x0000000000000000", "0x0000000000000000"],
    "XMM4": ["0x3FF0000000000000", "0x4008000000000000", "0x0000000000000000", "0x0000000000000000"],
    "XMM5": ["0x3FF0000000000000", "0x4008000000000000", "0x0000000000000000", "0x0000000000000000"],
    "XMM6": ["0xBFF0000000000000", "0x4008000000000000", "0xBFF0000000000000", "0x4008000000000000"],
    "XMM7": ["0xBFF0000000000000", "0x4008000000000000", "0xBFF0000000000000", "0x4008000000000000"],
    "XMM8": ["0x3FF0000000000000", "0x4008000000000000", "0x3FF0000000000000", "0x4008000000000000"],
    "XMM9": ["0x3FF0000000000000", "0x4008000000000000", "0x3FF0000000000000", "0x4008000000000000"]
  },
  "MemoryRegions": {
    "0x100000000": "4096"
  }
}
%endif

lea rdx, [rel .data]

vmovapd ymm0, [rdx]
vmovapd ymm1, [rdx + 32]

vaddsubpd xmm2, xmm0, [rdx + 32]
vaddsubpd xmm3, xmm0, xmm1

vaddsubpd xmm4, xmm1, [rdx]
vaddsubpd xmm5, xmm1, xmm0

vaddsubpd ymm6, ymm0, [rdx + 32]
vaddsubpd ymm7, ymm0, ymm1

vaddsubpd ymm8, ymm1, [rdx]
vaddsubpd ymm9, ymm1, ymm0

hlt

align 32
.data:
dq 0x3FF0000000000000
dq 0x3FF0000000000000
dq 0x3FF0000000000000
dq 0x3FF0000000000000

dq 0x4000000000000000
dq 0x4000000000000000
dq 0x4000000000000000
dq 0x4000000000000000