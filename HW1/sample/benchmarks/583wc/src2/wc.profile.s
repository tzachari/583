	.file	"wc.profile.bc"
	.text
	.globl	my_filbuf
	.align	16, 0x90
	.type	my_filbuf,@function
my_filbuf:                              # @my_filbuf
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp2:
	.cfi_def_cfa_offset 16
.Ltmp3:
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	incl	EdgeProfCounters(%rip)
	movl	$buffer, %edi
	movl	$1, %esi
	movl	$8192, %edx             # imm = 0x2000
	movq	%rbx, %rcx
	callq	fread
	movl	%eax, bufcount(%rip)
	movl	$0, bufcurrent(%rip)
	movq	%rbx, %rdi
	callq	feof
	testl	%eax, %eax
	je	.LBB0_1
# BB#2:                                 # %if.then
	incl	EdgeProfCounters+8(%rip)
	movslq	bufcount(%rip), %rax
	leal	1(%rax), %ecx
	movl	%ecx, bufcount(%rip)
	movb	$-1, buffer(%rax)
	incl	EdgeProfCounters+12(%rip)
	popq	%rbx
	ret
.LBB0_1:                                # %entry.if.end_crit_edge
	incl	EdgeProfCounters+4(%rip)
	popq	%rbx
	ret
.Ltmp4:
	.size	my_filbuf, .Ltmp4-my_filbuf
	.cfi_endproc

	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp12:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp13:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp14:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp15:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp16:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp17:
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
.Ltmp18:
	.cfi_def_cfa_offset 80
.Ltmp19:
	.cfi_offset %rbx, -56
.Ltmp20:
	.cfi_offset %r12, -48
.Ltmp21:
	.cfi_offset %r13, -40
.Ltmp22:
	.cfi_offset %r14, -32
.Ltmp23:
	.cfi_offset %r15, -24
.Ltmp24:
	.cfi_offset %rbp, -16
	movq	%rsi, %r15
	movl	$EdgeProfCounters, %edx
	movl	$112, %ecx
	callq	llvm_start_edge_profiling
	incl	EdgeProfCounters+16(%rip)
	cmpl	$1, %eax
	jle	.LBB1_1
# BB#6:                                 # %entry.land.rhs_crit_edge
	incl	EdgeProfCounters+20(%rip)
	addq	$8, %r15
	jmp	.LBB1_7
	.align	16, 0x90
.LBB1_17:                               # %sw.bb.land.rhs_crit_edge
                                        #   in Loop: Header=BB1_7 Depth=1
	incl	EdgeProfCounters+52(%rip)
	addq	$8, %r15
	movl	%ecx, %eax
.LBB1_7:                                # %land.rhs
                                        # =>This Inner Loop Header: Depth=1
	movq	(%r15), %rdx
	cmpb	$45, (%rdx)
	jne	.LBB1_8
# BB#9:                                 # %while.body
                                        #   in Loop: Header=BB1_7 Depth=1
	incl	EdgeProfCounters+28(%rip)
	movsbl	1(%rdx), %ecx
	incq	%rdx
	cmpl	$119, %ecx
	je	.LBB1_13
# BB#10:                                # %while.body
                                        #   in Loop: Header=BB1_7 Depth=1
	cmpl	$108, %ecx
	jne	.LBB1_11
# BB#14:                                # %while.body.sw.bb_crit_edge
                                        #   in Loop: Header=BB1_7 Depth=1
	incl	EdgeProfCounters+40(%rip)
	jmp	.LBB1_15
	.align	16, 0x90
.LBB1_13:                               # %while.body.sw.bb_crit_edge13
                                        #   in Loop: Header=BB1_7 Depth=1
	incl	EdgeProfCounters+44(%rip)
	jmp	.LBB1_15
	.align	16, 0x90
.LBB1_11:                               # %while.body
                                        #   in Loop: Header=BB1_7 Depth=1
	cmpl	$99, %ecx
	jne	.LBB1_18
# BB#12:                                # %while.body.sw.bb_crit_edge16
                                        #   in Loop: Header=BB1_7 Depth=1
	incl	EdgeProfCounters+48(%rip)
.LBB1_15:                               # %sw.bb
                                        #   in Loop: Header=BB1_7 Depth=1
	movq	%rdx, wd(%rip)
	leal	-1(%rax), %ecx
	cmpl	$1, %ecx
	jg	.LBB1_17
# BB#16:                                # %sw.bb.while.end_crit_edge
	incl	EdgeProfCounters+56(%rip)
	decl	%eax
	jmp	.LBB1_2
.LBB1_1:                                # %entry.while.end_crit_edge
	incl	EdgeProfCounters+24(%rip)
.LBB1_2:                                # %entry.while.end_crit_edge
	xorb	%r14b, %r14b
	jmp	.LBB1_3
.LBB1_8:                                # %land.rhs.while.end_crit_edge
	incl	EdgeProfCounters+32(%rip)
	addq	$-8, %r15
	movb	$1, %r14b
.LBB1_3:                                # %while.end
	movb	%r14b, 3(%rsp)          # 1-byte Spill
	movl	%eax, 4(%rsp)           # 4-byte Spill
	movq	%r15, 8(%rsp)           # 8-byte Spill
	movq	stdin(%rip), %rbp
	incl	EdgeProfCounters+60(%rip)
	movl	$1, %ecx
	jmp	.LBB1_4
	.align	16, 0x90
.LBB1_87:                               # %do.cond.do.body_crit_edge
                                        #   in Loop: Header=BB1_4 Depth=1
	incl	EdgeProfCounters+308(%rip)
.LBB1_4:                                # %do.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_22 Depth 2
                                        #       Child Loop BB1_23 Depth 3
                                        #         Child Loop BB1_28 Depth 4
                                        #       Child Loop BB1_25 Depth 3
                                        #     Child Loop BB1_51 Depth 2
                                        #     Child Loop BB1_71 Depth 2
	testb	%r14b, %r14b
	je	.LBB1_5
# BB#19:                                # %land.lhs.true
                                        #   in Loop: Header=BB1_4 Depth=1
	incl	EdgeProfCounters+64(%rip)
	movq	(%r15,%rcx,8), %rdi
	movl	$.L.str2, %esi
	movq	%rcx, %rbx
	callq	fopen
	movq	%rax, %rbp
	testq	%rbp, %rbp
	jne	.LBB1_20
# BB#108:                               # %if.then
                                        #   in Loop: Header=BB1_4 Depth=1
	incl	EdgeProfCounters+72(%rip)
	movq	(%r15,%rbx,8), %rdi
	callq	perror
	incl	EdgeProfCounters+80(%rip)
	xorl	%ebp, %ebp
	jmp	.LBB1_86
	.align	16, 0x90
.LBB1_5:                                # %do.body.if.end_crit_edge
                                        #   in Loop: Header=BB1_4 Depth=1
	movq	%rcx, 16(%rsp)          # 8-byte Spill
	incl	EdgeProfCounters+68(%rip)
	jmp	.LBB1_21
	.align	16, 0x90
.LBB1_20:                               # %land.lhs.true.if.end_crit_edge
                                        #   in Loop: Header=BB1_4 Depth=1
	movq	%rbx, 16(%rsp)          # 8-byte Spill
	incl	EdgeProfCounters+76(%rip)
.LBB1_21:                               # %if.end
                                        #   in Loop: Header=BB1_4 Depth=1
	movq	$0, linect(%rip)
	movq	$0, wordct(%rip)
	movq	$0, charct(%rip)
	movq	$0, last_charct(%rip)
	incl	EdgeProfCounters+84(%rip)
	jmp	.LBB1_22
	.align	16, 0x90
.LBB1_68:                               # %if.then50
                                        #   in Loop: Header=BB1_22 Depth=2
	incq	linect(%rip)
	incl	EdgeProfCounters+228(%rip)
.LBB1_22:                               # %if.end
                                        #   Parent Loop BB1_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_23 Depth 3
                                        #         Child Loop BB1_28 Depth 4
                                        #       Child Loop BB1_25 Depth 3
	xorl	%ebx, %ebx
	jmp	.LBB1_23
.LBB1_59:                               # %if.end45
                                        #   in Loop: Header=BB1_23 Depth=3
	movq	$0, last_charct(%rip)
	incl	EdgeProfCounters+208(%rip)
	.align	16, 0x90
.LBB1_23:                               # %for.cond.outer145
                                        #   Parent Loop BB1_4 Depth=1
                                        #     Parent Loop BB1_22 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB1_28 Depth 4
	movl	bufcurrent(%rip), %eax
	testl	%ebx, %ebx
	jne	.LBB1_24
# BB#27:                                # %for.cond.outer145.for.cond.us_crit_edge
                                        #   in Loop: Header=BB1_23 Depth=3
	incl	EdgeProfCounters+88(%rip)
	jmp	.LBB1_28
	.align	16, 0x90
.LBB1_43:                               # %if.end47.us.for.cond.us_crit_edge
                                        #   in Loop: Header=BB1_28 Depth=4
	incl	EdgeProfCounters+136(%rip)
	movl	%ecx, %eax
.LBB1_28:                               # %for.cond.us
                                        #   Parent Loop BB1_4 Depth=1
                                        #     Parent Loop BB1_22 Depth=2
                                        #       Parent Loop BB1_23 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	cmpl	bufcount(%rip), %eax
	jge	.LBB1_30
# BB#29:                                # %for.cond.us.cond.end.us_crit_edge
                                        #   in Loop: Header=BB1_28 Depth=4
	incl	EdgeProfCounters+96(%rip)
	jmp	.LBB1_34
	.align	16, 0x90
.LBB1_30:                               # %cond.true.us
                                        #   in Loop: Header=BB1_28 Depth=4
	incl	EdgeProfCounters+100(%rip)
	movl	$buffer, %edi
	movl	$1, %esi
	movl	$8192, %edx             # imm = 0x2000
	movq	%rbp, %rcx
	callq	fread
	movl	%eax, bufcount(%rip)
	movl	$0, bufcurrent(%rip)
	movq	%rbp, %rdi
	callq	feof
	testl	%eax, %eax
	jne	.LBB1_32
# BB#31:                                # %cond.true.us.my_filbuf.exit.us_crit_edge
                                        #   in Loop: Header=BB1_28 Depth=4
	incl	EdgeProfCounters+104(%rip)
	jmp	.LBB1_33
	.align	16, 0x90
.LBB1_32:                               # %if.then.i.us
                                        #   in Loop: Header=BB1_28 Depth=4
	incl	EdgeProfCounters+108(%rip)
	movslq	bufcount(%rip), %rax
	leal	1(%rax), %ecx
	movl	%ecx, bufcount(%rip)
	movb	$-1, buffer(%rax)
	incl	EdgeProfCounters+112(%rip)
.LBB1_33:                               # %my_filbuf.exit.us
                                        #   in Loop: Header=BB1_28 Depth=4
	movl	bufcurrent(%rip), %eax
	incl	EdgeProfCounters+116(%rip)
.LBB1_34:                               # %cond.end.us
                                        #   in Loop: Header=BB1_28 Depth=4
	leal	1(%rax), %ecx
	movl	%ecx, bufcurrent(%rip)
	movslq	%eax, %rax
	movb	buffer(%rax), %al
	cmpb	$-1, %al
	je	.LBB1_35
# BB#36:                                # %if.end27.us
                                        #   in Loop: Header=BB1_28 Depth=4
	incl	EdgeProfCounters+124(%rip)
	incq	charct(%rip)
	movq	last_charct(%rip), %rdx
	leaq	1(%rdx), %rsi
	movq	%rsi, last_charct(%rip)
	cmpb	$33, %al
	jge	.LBB1_37
.LBB1_38:                               # %if.end47.us
                                        #   in Loop: Header=BB1_28 Depth=4
	incl	EdgeProfCounters+132(%rip)
	cmpb	$32, %al
	je	.LBB1_42
# BB#39:                                # %if.end47.us
                                        #   in Loop: Header=BB1_28 Depth=4
	cmpb	$10, %al
	je	.LBB1_67
# BB#40:                                # %if.end47.us
                                        #   in Loop: Header=BB1_28 Depth=4
	cmpb	$9, %al
	jne	.LBB1_43
	jmp	.LBB1_41
.LBB1_37:                               # %if.end27.us
                                        #   in Loop: Header=BB1_28 Depth=4
	cmpb	$127, %al
	je	.LBB1_38
# BB#56:                                # %if.then36
                                        #   in Loop: Header=BB1_23 Depth=3
	incl	EdgeProfCounters+128(%rip)
	incq	wordct(%rip)
	incl	%ebx
	cmpq	$24, %rdx
	jl	.LBB1_58
# BB#57:                                # %if.then41
                                        #   in Loop: Header=BB1_23 Depth=3
	incl	EdgeProfCounters+192(%rip)
	incq	wordct_array+192(%rip)
	incl	EdgeProfCounters+200(%rip)
	jmp	.LBB1_59
.LBB1_58:                               # %if.else
                                        #   in Loop: Header=BB1_23 Depth=3
	incl	EdgeProfCounters+196(%rip)
	incq	wordct_array+8(,%rdx,8)
	incl	EdgeProfCounters+204(%rip)
	jmp	.LBB1_59
	.align	16, 0x90
.LBB1_24:                               # %for.cond.outer145.for.cond_crit_edge
                                        #   in Loop: Header=BB1_22 Depth=2
	incl	EdgeProfCounters+92(%rip)
	jmp	.LBB1_25
	.align	16, 0x90
.LBB1_42:                               # %if.end47.us.for.cond.outer145_crit_edge
                                        #   in Loop: Header=BB1_22 Depth=2
	incl	EdgeProfCounters+144(%rip)
	jmp	.LBB1_22
	.align	16, 0x90
.LBB1_67:                               # %if.end47.us.if.then50_crit_edge
                                        #   in Loop: Header=BB1_22 Depth=2
	incl	EdgeProfCounters+140(%rip)
	jmp	.LBB1_68
	.align	16, 0x90
.LBB1_66:                               # %if.end47.for.cond_crit_edge
                                        #   in Loop: Header=BB1_25 Depth=3
	incl	EdgeProfCounters+212(%rip)
	movl	%ecx, %eax
.LBB1_25:                               # %for.cond
                                        #   Parent Loop BB1_4 Depth=1
                                        #     Parent Loop BB1_22 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	bufcount(%rip), %eax
	jge	.LBB1_44
# BB#26:                                # %for.cond.cond.end_crit_edge
                                        #   in Loop: Header=BB1_25 Depth=3
	incl	EdgeProfCounters+152(%rip)
	jmp	.LBB1_48
	.align	16, 0x90
.LBB1_44:                               # %cond.true
                                        #   in Loop: Header=BB1_25 Depth=3
	incl	EdgeProfCounters+156(%rip)
	movl	$buffer, %edi
	movl	$1, %esi
	movl	$8192, %edx             # imm = 0x2000
	movq	%rbp, %rcx
	callq	fread
	movl	%eax, bufcount(%rip)
	movl	$0, bufcurrent(%rip)
	movq	%rbp, %rdi
	callq	feof
	testl	%eax, %eax
	jne	.LBB1_46
# BB#45:                                # %cond.true.my_filbuf.exit_crit_edge
                                        #   in Loop: Header=BB1_25 Depth=3
	incl	EdgeProfCounters+160(%rip)
	jmp	.LBB1_47
	.align	16, 0x90
.LBB1_46:                               # %if.then.i
                                        #   in Loop: Header=BB1_25 Depth=3
	incl	EdgeProfCounters+164(%rip)
	movslq	bufcount(%rip), %rax
	leal	1(%rax), %ecx
	movl	%ecx, bufcount(%rip)
	movb	$-1, buffer(%rax)
	incl	EdgeProfCounters+168(%rip)
.LBB1_47:                               # %my_filbuf.exit
                                        #   in Loop: Header=BB1_25 Depth=3
	movl	bufcurrent(%rip), %eax
	incl	EdgeProfCounters+172(%rip)
.LBB1_48:                               # %cond.end
                                        #   in Loop: Header=BB1_25 Depth=3
	leal	1(%rax), %ecx
	movl	%ecx, bufcurrent(%rip)
	movslq	%eax, %rax
	movb	buffer(%rax), %al
	cmpb	$-1, %al
	je	.LBB1_49
# BB#53:                                # %if.end27
                                        #   in Loop: Header=BB1_25 Depth=3
	incl	EdgeProfCounters+180(%rip)
	incq	charct(%rip)
	incq	last_charct(%rip)
	cmpb	$33, %al
	jl	.LBB1_60
# BB#54:                                # %if.end27
                                        #   in Loop: Header=BB1_25 Depth=3
	cmpb	$127, %al
	je	.LBB1_60
# BB#55:                                # %if.end27.for.cond_crit_edge
                                        #   in Loop: Header=BB1_25 Depth=3
	incl	EdgeProfCounters+184(%rip)
	movl	%ecx, %eax
	jmp	.LBB1_25
	.align	16, 0x90
.LBB1_60:                               # %if.end47
                                        #   in Loop: Header=BB1_25 Depth=3
	incl	EdgeProfCounters+188(%rip)
	cmpb	$32, %al
	je	.LBB1_64
# BB#61:                                # %if.end47
                                        #   in Loop: Header=BB1_25 Depth=3
	cmpb	$10, %al
	je	.LBB1_65
# BB#62:                                # %if.end47
                                        #   in Loop: Header=BB1_25 Depth=3
	cmpb	$9, %al
	jne	.LBB1_66
# BB#63:                                # %if.end47.for.cond.outer145_crit_edge106
                                        #   in Loop: Header=BB1_22 Depth=2
	incl	EdgeProfCounters+224(%rip)
	jmp	.LBB1_22
	.align	16, 0x90
.LBB1_64:                               # %if.end47.for.cond.outer145_crit_edge
                                        #   in Loop: Header=BB1_22 Depth=2
	incl	EdgeProfCounters+220(%rip)
	jmp	.LBB1_22
	.align	16, 0x90
.LBB1_65:                               # %if.end47.if.then50_crit_edge
                                        #   in Loop: Header=BB1_22 Depth=2
	incl	EdgeProfCounters+216(%rip)
	jmp	.LBB1_68
.LBB1_41:                               # %if.end47.us.for.cond.outer145_crit_edge67
                                        #   in Loop: Header=BB1_22 Depth=2
	incl	EdgeProfCounters+148(%rip)
	jmp	.LBB1_22
	.align	16, 0x90
.LBB1_49:                               # %cond.end.for.end_crit_edge
                                        #   in Loop: Header=BB1_4 Depth=1
	incl	EdgeProfCounters+176(%rip)
	jmp	.LBB1_50
	.align	16, 0x90
.LBB1_35:                               # %cond.end.us.for.end_crit_edge
                                        #   in Loop: Header=BB1_4 Depth=1
	incl	EdgeProfCounters+120(%rip)
.LBB1_50:                               # %for.end
                                        #   in Loop: Header=BB1_4 Depth=1
	movq	linect(%rip), %r12
	movq	wordct(%rip), %r13
	movq	charct(%rip), %rbx
	movq	wd(%rip), %r15
	movl	$.Lstr9, %edi
	callq	puts
	incl	EdgeProfCounters+232(%rip)
	xorl	%r14d, %r14d
	jmp	.LBB1_51
	.align	16, 0x90
.LBB1_52:                               # %for.body.i.for.body.i_crit_edge
                                        #   in Loop: Header=BB1_51 Depth=2
	incq	%r14
	incl	EdgeProfCounters+248(%rip)
.LBB1_51:                               # %for.body.i
                                        #   Parent Loop BB1_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	wordct_array(,%r14,8), %rdx
	movl	$.L.str7, %edi
	movl	%r14d, %esi
	xorb	%al, %al
	callq	printf
	cmpl	$24, %r14d
	jne	.LBB1_52
# BB#69:                                # %while.cond.preheader.i
                                        #   in Loop: Header=BB1_4 Depth=1
	incl	EdgeProfCounters+244(%rip)
	movb	(%r15), %al
	testb	%al, %al
	jne	.LBB1_70
# BB#81:                                # %while.cond.preheader.i.wcp.exit_crit_edge
                                        #   in Loop: Header=BB1_4 Depth=1
	incl	EdgeProfCounters+236(%rip)
	jmp	.LBB1_82
	.align	16, 0x90
.LBB1_70:                               # %while.cond.preheader.i.while.body.i_crit_edge
                                        #   in Loop: Header=BB1_4 Depth=1
	incl	EdgeProfCounters+240(%rip)
	jmp	.LBB1_71
	.align	16, 0x90
.LBB1_76:                               # %while.cond.backedge.i.while.body.i_crit_edge
                                        #   in Loop: Header=BB1_71 Depth=2
	incl	EdgeProfCounters+272(%rip)
.LBB1_71:                               # %while.cond.preheader.i.while.body.i_crit_edge
                                        #   Parent Loop BB1_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	incq	%r15
	movsbl	%al, %eax
	cmpl	$99, %eax
	je	.LBB1_80
# BB#72:                                # %while.body.i
                                        #   in Loop: Header=BB1_71 Depth=2
	cmpl	$108, %eax
	jne	.LBB1_73
# BB#78:                                # %sw.bb.i
                                        #   in Loop: Header=BB1_71 Depth=2
	incl	EdgeProfCounters+256(%rip)
	movl	$.L.str8, %edi
	movq	%r12, %rsi
	xorb	%al, %al
	callq	printf
	incl	EdgeProfCounters+276(%rip)
	jmp	.LBB1_75
	.align	16, 0x90
.LBB1_80:                               # %sw.bb3.i
                                        #   in Loop: Header=BB1_71 Depth=2
	incl	EdgeProfCounters+264(%rip)
	movl	$.L.str8, %edi
	movq	%rbx, %rsi
	xorb	%al, %al
	callq	printf
	incl	EdgeProfCounters+284(%rip)
	jmp	.LBB1_75
	.align	16, 0x90
.LBB1_73:                               # %while.body.i
                                        #   in Loop: Header=BB1_71 Depth=2
	cmpl	$119, %eax
	jne	.LBB1_74
# BB#79:                                # %sw.bb2.i
                                        #   in Loop: Header=BB1_71 Depth=2
	incl	EdgeProfCounters+260(%rip)
	movl	$.L.str8, %edi
	movq	%r13, %rsi
	xorb	%al, %al
	callq	printf
	incl	EdgeProfCounters+280(%rip)
	jmp	.LBB1_75
.LBB1_74:                               # %while.body.i.while.cond.backedge.i_crit_edge
                                        #   in Loop: Header=BB1_71 Depth=2
	incl	EdgeProfCounters+252(%rip)
	.align	16, 0x90
.LBB1_75:                               # %while.cond.backedge.i
                                        #   in Loop: Header=BB1_71 Depth=2
	movb	(%r15), %al
	testb	%al, %al
	jne	.LBB1_76
# BB#77:                                # %while.cond.backedge.i.wcp.exit_crit_edge
                                        #   in Loop: Header=BB1_4 Depth=1
	incl	EdgeProfCounters+268(%rip)
.LBB1_82:                               # %wcp.exit
                                        #   in Loop: Header=BB1_4 Depth=1
	movb	3(%rsp), %r14b          # 1-byte Reload
	testb	%r14b, %r14b
	movq	8(%rsp), %r15           # 8-byte Reload
	je	.LBB1_84
# BB#83:                                # %if.then73
                                        #   in Loop: Header=BB1_4 Depth=1
	incl	EdgeProfCounters+288(%rip)
	movq	16(%rsp), %rax          # 8-byte Reload
	movq	(%r15,%rax,8), %rsi
	movl	$.L.str3, %edi
	xorb	%al, %al
	callq	printf
	incl	EdgeProfCounters+296(%rip)
	jmp	.LBB1_85
	.align	16, 0x90
.LBB1_84:                               # %if.else77
                                        #   in Loop: Header=BB1_4 Depth=1
	incl	EdgeProfCounters+292(%rip)
	movl	$10, %edi
	callq	putchar
	incl	EdgeProfCounters+300(%rip)
.LBB1_85:                               # %if.end79
                                        #   in Loop: Header=BB1_4 Depth=1
	movq	%rbp, %rdi
	callq	fclose
	movq	linect(%rip), %rax
	addq	%rax, tlinect(%rip)
	movq	wordct(%rip), %rax
	addq	%rax, twordct(%rip)
	movq	charct(%rip), %rax
	addq	%rax, tcharct(%rip)
	incl	EdgeProfCounters+304(%rip)
	movq	16(%rsp), %rbx          # 8-byte Reload
.LBB1_86:                               # %do.cond
                                        #   in Loop: Header=BB1_4 Depth=1
	incq	%rbx
	movl	4(%rsp), %eax           # 4-byte Reload
	cmpl	%eax, %ebx
	movq	%rbx, %rcx
	jl	.LBB1_87
# BB#88:                                # %do.end
	incl	EdgeProfCounters+312(%rip)
	cmpl	$2, %eax
	jle	.LBB1_89
# BB#98:                                # %if.then88
	incl	EdgeProfCounters+316(%rip)
	movq	tlinect(%rip), %r14
	movq	twordct(%rip), %r15
	movq	tcharct(%rip), %r12
	movq	wd(%rip), %rbx
	movl	$.Lstr9, %edi
	callq	puts
	incl	EdgeProfCounters+324(%rip)
	xorl	%ebp, %ebp
	jmp	.LBB1_99
	.align	16, 0x90
.LBB1_100:                              # %for.body.i127.for.body.i127_crit_edge
                                        #   in Loop: Header=BB1_99 Depth=1
	incq	%rbp
	incl	EdgeProfCounters+340(%rip)
.LBB1_99:                               # %for.body.i127
                                        # =>This Inner Loop Header: Depth=1
	movq	wordct_array(,%rbp,8), %rdx
	movl	$.L.str7, %edi
	movl	%ebp, %esi
	xorb	%al, %al
	callq	printf
	cmpl	$24, %ebp
	jne	.LBB1_100
# BB#90:                                # %while.cond.preheader.i120
	incl	EdgeProfCounters+336(%rip)
	movb	(%rbx), %al
	testb	%al, %al
	je	.LBB1_105
# BB#91:                                # %while.cond.preheader.i120.while.body.i131_crit_edge
	incl	EdgeProfCounters+332(%rip)
	jmp	.LBB1_92
	.align	16, 0x90
.LBB1_97:                               # %while.cond.backedge.i133.while.body.i131_crit_edge
                                        #   in Loop: Header=BB1_92 Depth=1
	incl	EdgeProfCounters+364(%rip)
.LBB1_92:                               # %while.cond.preheader.i120.while.body.i131_crit_edge
                                        # =>This Inner Loop Header: Depth=1
	incq	%rbx
	movsbl	%al, %eax
	cmpl	$99, %eax
	je	.LBB1_104
# BB#93:                                # %while.body.i131
                                        #   in Loop: Header=BB1_92 Depth=1
	cmpl	$108, %eax
	jne	.LBB1_94
# BB#102:                               # %sw.bb.i135
                                        #   in Loop: Header=BB1_92 Depth=1
	incl	EdgeProfCounters+348(%rip)
	movl	$.L.str8, %edi
	movq	%r14, %rsi
	xorb	%al, %al
	callq	printf
	incl	EdgeProfCounters+368(%rip)
	jmp	.LBB1_96
	.align	16, 0x90
.LBB1_104:                              # %sw.bb3.i139
                                        #   in Loop: Header=BB1_92 Depth=1
	incl	EdgeProfCounters+356(%rip)
	movl	$.L.str8, %edi
	movq	%r12, %rsi
	xorb	%al, %al
	callq	printf
	incl	EdgeProfCounters+376(%rip)
	jmp	.LBB1_96
	.align	16, 0x90
.LBB1_94:                               # %while.body.i131
                                        #   in Loop: Header=BB1_92 Depth=1
	cmpl	$119, %eax
	jne	.LBB1_95
# BB#103:                               # %sw.bb2.i137
                                        #   in Loop: Header=BB1_92 Depth=1
	incl	EdgeProfCounters+352(%rip)
	movl	$.L.str8, %edi
	movq	%r15, %rsi
	xorb	%al, %al
	callq	printf
	incl	EdgeProfCounters+372(%rip)
	jmp	.LBB1_96
.LBB1_95:                               # %while.body.i131.while.cond.backedge.i133_crit_edge
                                        #   in Loop: Header=BB1_92 Depth=1
	incl	EdgeProfCounters+344(%rip)
	.align	16, 0x90
.LBB1_96:                               # %while.cond.backedge.i133
                                        #   in Loop: Header=BB1_92 Depth=1
	movb	(%rbx), %al
	testb	%al, %al
	jne	.LBB1_97
# BB#101:                               # %while.cond.backedge.i133.wcp.exit140_crit_edge
	incl	EdgeProfCounters+360(%rip)
	jmp	.LBB1_106
.LBB1_18:                               # %usage
	incl	EdgeProfCounters+36(%rip)
	movq	stderr(%rip), %rcx
	movl	$.L.str1, %edi
	movl	$25, %esi
	movl	$1, %edx
	callq	fwrite
	movl	$1, %edi
	callq	exit
.LBB1_89:                               # %do.end.if.end90_crit_edge
	incl	EdgeProfCounters+320(%rip)
	xorl	%edi, %edi
	callq	exit
.LBB1_105:                              # %while.cond.preheader.i120.wcp.exit140_crit_edge
	incl	EdgeProfCounters+328(%rip)
.LBB1_106:                              # %wcp.exit140
	movl	$.Lstr, %edi
	callq	puts
	incl	EdgeProfCounters+380(%rip)
	xorl	%edi, %edi
	callq	exit
.Ltmp25:
	.size	main, .Ltmp25-main
	.cfi_endproc

	.globl	wcp
	.align	16, 0x90
	.type	wcp,@function
wcp:                                    # @wcp
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp33:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp34:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp35:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp36:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp37:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp38:
	.cfi_def_cfa_offset 56
	pushq	%rax
.Ltmp39:
	.cfi_def_cfa_offset 64
.Ltmp40:
	.cfi_offset %rbx, -56
.Ltmp41:
	.cfi_offset %r12, -48
.Ltmp42:
	.cfi_offset %r13, -40
.Ltmp43:
	.cfi_offset %r14, -32
.Ltmp44:
	.cfi_offset %r15, -24
.Ltmp45:
	.cfi_offset %rbp, -16
	movq	%r8, %r13
	movq	%rcx, %r14
	movq	%rdx, %r15
	movq	%rsi, %r12
	movq	%rdi, %rbx
	incl	EdgeProfCounters+384(%rip)
	movl	$.Lstr9, %edi
	callq	puts
	incl	EdgeProfCounters+388(%rip)
	xorl	%ebp, %ebp
	jmp	.LBB2_1
	.align	16, 0x90
.LBB2_16:                               # %for.body.for.body_crit_edge
                                        #   in Loop: Header=BB2_1 Depth=1
	incq	%rbp
	incl	EdgeProfCounters+404(%rip)
.LBB2_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movq	(%r13,%rbp,8), %rdx
	movl	$.L.str7, %edi
	movl	%ebp, %esi
	xorb	%al, %al
	callq	printf
	cmpl	$24, %ebp
	jne	.LBB2_16
# BB#2:                                 # %while.cond.preheader
	incl	EdgeProfCounters+400(%rip)
	movb	(%rbx), %al
	testb	%al, %al
	je	.LBB2_14
# BB#3:                                 # %while.cond.preheader.while.body_crit_edge
	incl	EdgeProfCounters+396(%rip)
	jmp	.LBB2_4
	.align	16, 0x90
.LBB2_9:                                # %while.cond.backedge.while.body_crit_edge
                                        #   in Loop: Header=BB2_4 Depth=1
	incl	EdgeProfCounters+428(%rip)
.LBB2_4:                                # %while.cond.preheader.while.body_crit_edge
                                        # =>This Inner Loop Header: Depth=1
	incq	%rbx
	movsbl	%al, %eax
	cmpl	$99, %eax
	je	.LBB2_13
# BB#5:                                 # %while.body
                                        #   in Loop: Header=BB2_4 Depth=1
	cmpl	$108, %eax
	jne	.LBB2_6
# BB#11:                                # %sw.bb
                                        #   in Loop: Header=BB2_4 Depth=1
	incl	EdgeProfCounters+412(%rip)
	movl	$.L.str8, %edi
	movq	%r14, %rsi
	xorb	%al, %al
	callq	printf
	incl	EdgeProfCounters+432(%rip)
	jmp	.LBB2_8
	.align	16, 0x90
.LBB2_13:                               # %sw.bb3
                                        #   in Loop: Header=BB2_4 Depth=1
	incl	EdgeProfCounters+420(%rip)
	movl	$.L.str8, %edi
	movq	%r12, %rsi
	xorb	%al, %al
	callq	printf
	incl	EdgeProfCounters+440(%rip)
	jmp	.LBB2_8
	.align	16, 0x90
.LBB2_6:                                # %while.body
                                        #   in Loop: Header=BB2_4 Depth=1
	cmpl	$119, %eax
	jne	.LBB2_7
# BB#12:                                # %sw.bb2
                                        #   in Loop: Header=BB2_4 Depth=1
	incl	EdgeProfCounters+416(%rip)
	movl	$.L.str8, %edi
	movq	%r15, %rsi
	xorb	%al, %al
	callq	printf
	incl	EdgeProfCounters+436(%rip)
	jmp	.LBB2_8
.LBB2_7:                                # %while.body.while.cond.backedge_crit_edge
                                        #   in Loop: Header=BB2_4 Depth=1
	incl	EdgeProfCounters+408(%rip)
	.align	16, 0x90
.LBB2_8:                                # %while.cond.backedge
                                        #   in Loop: Header=BB2_4 Depth=1
	movb	(%rbx), %al
	testb	%al, %al
	jne	.LBB2_9
# BB#10:                                # %while.cond.backedge.while.end_crit_edge
	incl	EdgeProfCounters+424(%rip)
	jmp	.LBB2_15
.LBB2_14:                               # %while.cond.preheader.while.end_crit_edge
	incl	EdgeProfCounters+392(%rip)
.LBB2_15:                               # %while.end
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp46:
	.size	wcp, .Ltmp46-wcp
	.cfi_endproc

	.globl	ipr
	.align	16, 0x90
	.type	ipr,@function
ipr:                                    # @ipr
	.cfi_startproc
# BB#0:                                 # %entry
	movq	%rdi, %rax
	incl	EdgeProfCounters+444(%rip)
	movl	$.L.str8, %edi
	movq	%rax, %rsi
	xorb	%al, %al
	jmp	printf                  # TAILCALL
.Ltmp47:
	.size	ipr, .Ltmp47-ipr
	.cfi_endproc

	.type	copyright,@object       # @copyright
	.data
	.globl	copyright
	.align	16
copyright:
	.asciz	 "@(#) Copyright (c) 1980 Regents of the University of California.\n All rights reserved.\n"
	.size	copyright, 88

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "lwc"
	.size	.L.str, 4

	.type	wd,@object              # @wd
	.data
	.globl	wd
	.align	8
wd:
	.quad	.L.str
	.size	wd, 8

	.type	buffer,@object          # @buffer
	.local	buffer
	.comm	buffer,8192,16
	.type	bufcount,@object        # @bufcount
	.local	bufcount
	.comm	bufcount,4,4
	.type	bufcurrent,@object      # @bufcurrent
	.local	bufcurrent
	.comm	bufcurrent,4,4
	.type	.L.str1,@object         # @.str1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str1:
	.asciz	 "Usage: wc [-lwc] [files]\n"
	.size	.L.str1, 26

	.type	.L.str2,@object         # @.str2
.L.str2:
	.asciz	 "r"
	.size	.L.str2, 2

	.type	linect,@object          # @linect
	.comm	linect,8,8
	.type	wordct,@object          # @wordct
	.comm	wordct,8,8
	.type	charct,@object          # @charct
	.comm	charct,8,8
	.type	last_charct,@object     # @last_charct
	.comm	last_charct,8,8
	.type	wordct_array,@object    # @wordct_array
	.comm	wordct_array,200,16
	.type	.L.str3,@object         # @.str3
.L.str3:
	.asciz	 " %s\n"
	.size	.L.str3, 5

	.type	tlinect,@object         # @tlinect
	.comm	tlinect,8,8
	.type	twordct,@object         # @twordct
	.comm	twordct,8,8
	.type	tcharct,@object         # @tcharct
	.comm	tcharct,8,8
	.type	.L.str7,@object         # @.str7
.L.str7:
	.asciz	 "%d: %ld\n"
	.size	.L.str7, 9

	.type	.L.str8,@object         # @.str8
.L.str8:
	.asciz	 " %7ld"
	.size	.L.str8, 6

	.type	pagect,@object          # @pagect
	.comm	pagect,8,8
	.type	tpagect,@object         # @tpagect
	.comm	tpagect,8,8
	.type	.Lstr,@object           # @str
.Lstr:
	.asciz	 " total"
	.size	.Lstr, 7

	.type	.Lstr9,@object          # @str9
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstr9:
	.asciz	 "Word size histogran"
	.size	.Lstr9, 20

	.type	EdgeProfCounters,@object # @EdgeProfCounters
	.local	EdgeProfCounters
	.comm	EdgeProfCounters,448,16

	.section	".note.GNU-stack","",@progbits
