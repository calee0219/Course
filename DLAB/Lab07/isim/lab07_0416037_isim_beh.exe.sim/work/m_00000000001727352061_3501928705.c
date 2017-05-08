/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "D:/Lab07_0416037/Lab07.v";
static int ng1[] = {0, 0};
static int ng2[] = {1, 0};



static void Always_72_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;

LAB0:    t1 = (t0 + 5376U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(72, ng0);
    t2 = (t0 + 6936);
    *((int *)t2) = 1;
    t3 = (t0 + 5408);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(73, ng0);

LAB5:    xsi_set_current_line(74, ng0);
    t4 = (t0 + 2136U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(75, ng0);
    t2 = (t0 + 3976);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3816);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 2, 0LL);

LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(74, ng0);
    t11 = (t0 + 472);
    t12 = *((char **)t11);
    t11 = (t0 + 3816);
    xsi_vlogvar_wait_assign_value(t11, t12, 0, 0, 2, 0LL);
    goto LAB8;

}

static void Always_79_1(char *t0)
{
    char t11[8];
    char t25[8];
    char t32[8];
    char t60[8];
    char t75[8];
    char t82[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    int t9;
    char *t10;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;
    char *t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    char *t36;
    char *t37;
    char *t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    char *t46;
    char *t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    char *t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    char *t67;
    char *t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    char *t73;
    char *t74;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    char *t81;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    char *t86;
    char *t87;
    char *t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    char *t96;
    char *t97;
    unsigned int t98;
    unsigned int t99;
    unsigned int t100;
    int t101;
    unsigned int t102;
    unsigned int t103;
    unsigned int t104;
    int t105;
    unsigned int t106;
    unsigned int t107;
    unsigned int t108;
    unsigned int t109;
    char *t110;
    unsigned int t111;
    unsigned int t112;
    unsigned int t113;
    unsigned int t114;
    unsigned int t115;
    char *t116;
    char *t117;

LAB0:    t1 = (t0 + 5624U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(79, ng0);
    t2 = (t0 + 6952);
    *((int *)t2) = 1;
    t3 = (t0 + 5656);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(80, ng0);

LAB5:    xsi_set_current_line(81, ng0);
    t4 = (t0 + 3816);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);

LAB6:    t7 = (t0 + 472);
    t8 = *((char **)t7);
    t9 = xsi_vlog_unsigned_case_compare(t6, 2, t8, 32);
    if (t9 == 1)
        goto LAB7;

LAB8:    t2 = (t0 + 608);
    t3 = *((char **)t2);
    t9 = xsi_vlog_unsigned_case_compare(t6, 2, t3, 32);
    if (t9 == 1)
        goto LAB9;

LAB10:    t2 = (t0 + 744);
    t3 = *((char **)t2);
    t9 = xsi_vlog_unsigned_case_compare(t6, 2, t3, 32);
    if (t9 == 1)
        goto LAB11;

LAB12:    t2 = (t0 + 880);
    t3 = *((char **)t2);
    t9 = xsi_vlog_unsigned_case_compare(t6, 2, t3, 32);
    if (t9 == 1)
        goto LAB13;

LAB14:
LAB16:
LAB15:    xsi_set_current_line(92, ng0);
    t2 = (t0 + 472);
    t3 = *((char **)t2);
    t2 = (t0 + 3976);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 2);

LAB17:    goto LAB2;

LAB7:    xsi_set_current_line(82, ng0);

LAB18:    xsi_set_current_line(83, ng0);
    t7 = (t0 + 2456U);
    t10 = *((char **)t7);
    memset(t11, 0, 8);
    t7 = (t10 + 4);
    t12 = *((unsigned int *)t7);
    t13 = (~(t12));
    t14 = *((unsigned int *)t10);
    t15 = (t14 & t13);
    t16 = (t15 & 1U);
    if (t16 != 0)
        goto LAB19;

LAB20:    if (*((unsigned int *)t7) != 0)
        goto LAB21;

LAB22:    t18 = (t11 + 4);
    t19 = *((unsigned int *)t11);
    t20 = (!(t19));
    t21 = *((unsigned int *)t18);
    t22 = (t20 || t21);
    if (t22 > 0)
        goto LAB23;

LAB24:    memcpy(t32, t11, 8);

LAB25:    memset(t60, 0, 8);
    t61 = (t32 + 4);
    t62 = *((unsigned int *)t61);
    t63 = (~(t62));
    t64 = *((unsigned int *)t32);
    t65 = (t64 & t63);
    t66 = (t65 & 1U);
    if (t66 != 0)
        goto LAB33;

LAB34:    if (*((unsigned int *)t61) != 0)
        goto LAB35;

LAB36:    t68 = (t60 + 4);
    t69 = *((unsigned int *)t60);
    t70 = (!(t69));
    t71 = *((unsigned int *)t68);
    t72 = (t70 || t71);
    if (t72 > 0)
        goto LAB37;

LAB38:    memcpy(t82, t60, 8);

LAB39:    t110 = (t82 + 4);
    t111 = *((unsigned int *)t110);
    t112 = (~(t111));
    t113 = *((unsigned int *)t82);
    t114 = (t113 & t112);
    t115 = (t114 != 0);
    if (t115 > 0)
        goto LAB47;

LAB48:    xsi_set_current_line(84, ng0);
    t2 = (t0 + 472);
    t3 = *((char **)t2);
    t2 = (t0 + 3976);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 2);

LAB49:    goto LAB17;

LAB9:    xsi_set_current_line(86, ng0);
    t2 = (t0 + 880);
    t4 = *((char **)t2);
    t2 = (t0 + 3976);
    xsi_vlogvar_assign_value(t2, t4, 0, 0, 2);
    goto LAB17;

LAB11:    xsi_set_current_line(87, ng0);
    t2 = (t0 + 744);
    t4 = *((char **)t2);
    t2 = (t0 + 3976);
    xsi_vlogvar_assign_value(t2, t4, 0, 0, 2);
    goto LAB17;

LAB13:    xsi_set_current_line(88, ng0);

LAB50:    xsi_set_current_line(89, ng0);
    t2 = (t0 + 4136);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t7 = (t0 + 3656);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    memset(t11, 0, 8);
    t17 = (t5 + 4);
    t18 = (t10 + 4);
    t12 = *((unsigned int *)t5);
    t13 = *((unsigned int *)t10);
    t14 = (t12 ^ t13);
    t15 = *((unsigned int *)t17);
    t16 = *((unsigned int *)t18);
    t19 = (t15 ^ t16);
    t20 = (t14 | t19);
    t21 = *((unsigned int *)t17);
    t22 = *((unsigned int *)t18);
    t26 = (t21 | t22);
    t27 = (~(t26));
    t28 = (t20 & t27);
    if (t28 != 0)
        goto LAB54;

LAB51:    if (t26 != 0)
        goto LAB53;

LAB52:    *((unsigned int *)t11) = 1;

LAB54:    t24 = (t11 + 4);
    t29 = *((unsigned int *)t24);
    t30 = (~(t29));
    t33 = *((unsigned int *)t11);
    t34 = (t33 & t30);
    t35 = (t34 != 0);
    if (t35 > 0)
        goto LAB55;

LAB56:    xsi_set_current_line(90, ng0);
    t2 = (t0 + 880);
    t3 = *((char **)t2);
    t2 = (t0 + 3976);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 2);

LAB57:    goto LAB17;

LAB19:    *((unsigned int *)t11) = 1;
    goto LAB22;

LAB21:    t17 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t17) = 1;
    goto LAB22;

LAB23:    t23 = (t0 + 2616U);
    t24 = *((char **)t23);
    memset(t25, 0, 8);
    t23 = (t24 + 4);
    t26 = *((unsigned int *)t23);
    t27 = (~(t26));
    t28 = *((unsigned int *)t24);
    t29 = (t28 & t27);
    t30 = (t29 & 1U);
    if (t30 != 0)
        goto LAB26;

LAB27:    if (*((unsigned int *)t23) != 0)
        goto LAB28;

LAB29:    t33 = *((unsigned int *)t11);
    t34 = *((unsigned int *)t25);
    t35 = (t33 | t34);
    *((unsigned int *)t32) = t35;
    t36 = (t11 + 4);
    t37 = (t25 + 4);
    t38 = (t32 + 4);
    t39 = *((unsigned int *)t36);
    t40 = *((unsigned int *)t37);
    t41 = (t39 | t40);
    *((unsigned int *)t38) = t41;
    t42 = *((unsigned int *)t38);
    t43 = (t42 != 0);
    if (t43 == 1)
        goto LAB30;

LAB31:
LAB32:    goto LAB25;

LAB26:    *((unsigned int *)t25) = 1;
    goto LAB29;

LAB28:    t31 = (t25 + 4);
    *((unsigned int *)t25) = 1;
    *((unsigned int *)t31) = 1;
    goto LAB29;

LAB30:    t44 = *((unsigned int *)t32);
    t45 = *((unsigned int *)t38);
    *((unsigned int *)t32) = (t44 | t45);
    t46 = (t11 + 4);
    t47 = (t25 + 4);
    t48 = *((unsigned int *)t46);
    t49 = (~(t48));
    t50 = *((unsigned int *)t11);
    t51 = (t50 & t49);
    t52 = *((unsigned int *)t47);
    t53 = (~(t52));
    t54 = *((unsigned int *)t25);
    t55 = (t54 & t53);
    t56 = (~(t51));
    t57 = (~(t55));
    t58 = *((unsigned int *)t38);
    *((unsigned int *)t38) = (t58 & t56);
    t59 = *((unsigned int *)t38);
    *((unsigned int *)t38) = (t59 & t57);
    goto LAB32;

LAB33:    *((unsigned int *)t60) = 1;
    goto LAB36;

LAB35:    t67 = (t60 + 4);
    *((unsigned int *)t60) = 1;
    *((unsigned int *)t67) = 1;
    goto LAB36;

LAB37:    t73 = (t0 + 2776U);
    t74 = *((char **)t73);
    memset(t75, 0, 8);
    t73 = (t74 + 4);
    t76 = *((unsigned int *)t73);
    t77 = (~(t76));
    t78 = *((unsigned int *)t74);
    t79 = (t78 & t77);
    t80 = (t79 & 1U);
    if (t80 != 0)
        goto LAB40;

LAB41:    if (*((unsigned int *)t73) != 0)
        goto LAB42;

LAB43:    t83 = *((unsigned int *)t60);
    t84 = *((unsigned int *)t75);
    t85 = (t83 | t84);
    *((unsigned int *)t82) = t85;
    t86 = (t60 + 4);
    t87 = (t75 + 4);
    t88 = (t82 + 4);
    t89 = *((unsigned int *)t86);
    t90 = *((unsigned int *)t87);
    t91 = (t89 | t90);
    *((unsigned int *)t88) = t91;
    t92 = *((unsigned int *)t88);
    t93 = (t92 != 0);
    if (t93 == 1)
        goto LAB44;

LAB45:
LAB46:    goto LAB39;

LAB40:    *((unsigned int *)t75) = 1;
    goto LAB43;

LAB42:    t81 = (t75 + 4);
    *((unsigned int *)t75) = 1;
    *((unsigned int *)t81) = 1;
    goto LAB43;

LAB44:    t94 = *((unsigned int *)t82);
    t95 = *((unsigned int *)t88);
    *((unsigned int *)t82) = (t94 | t95);
    t96 = (t60 + 4);
    t97 = (t75 + 4);
    t98 = *((unsigned int *)t96);
    t99 = (~(t98));
    t100 = *((unsigned int *)t60);
    t101 = (t100 & t99);
    t102 = *((unsigned int *)t97);
    t103 = (~(t102));
    t104 = *((unsigned int *)t75);
    t105 = (t104 & t103);
    t106 = (~(t101));
    t107 = (~(t105));
    t108 = *((unsigned int *)t88);
    *((unsigned int *)t88) = (t108 & t106);
    t109 = *((unsigned int *)t88);
    *((unsigned int *)t88) = (t109 & t107);
    goto LAB46;

LAB47:    xsi_set_current_line(83, ng0);
    t116 = (t0 + 608);
    t117 = *((char **)t116);
    t116 = (t0 + 3976);
    xsi_vlogvar_assign_value(t116, t117, 0, 0, 2);
    goto LAB49;

LAB53:    t23 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB54;

LAB55:    xsi_set_current_line(89, ng0);
    t31 = (t0 + 744);
    t36 = *((char **)t31);
    t31 = (t0 + 3976);
    xsi_vlogvar_assign_value(t31, t36, 0, 0, 2);
    goto LAB57;

}

static void Always_101_2(char *t0)
{
    char t14[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    int t13;
    char *t15;

LAB0:    t1 = (t0 + 5872U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(101, ng0);
    t2 = (t0 + 6968);
    *((int *)t2) = 1;
    t3 = (t0 + 5904);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(102, ng0);

LAB5:    xsi_set_current_line(103, ng0);
    t4 = (t0 + 2136U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(104, ng0);

LAB9:    xsi_set_current_line(105, ng0);
    t2 = (t0 + 3816);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);

LAB10:    t5 = (t0 + 472);
    t11 = *((char **)t5);
    t13 = xsi_vlog_unsigned_case_compare(t4, 2, t11, 32);
    if (t13 == 1)
        goto LAB11;

LAB12:    t2 = (t0 + 608);
    t3 = *((char **)t2);
    t13 = xsi_vlog_unsigned_case_compare(t4, 2, t3, 32);
    if (t13 == 1)
        goto LAB13;

LAB14:    t2 = (t0 + 744);
    t3 = *((char **)t2);
    t13 = xsi_vlog_unsigned_case_compare(t4, 2, t3, 32);
    if (t13 == 1)
        goto LAB15;

LAB16:    t2 = (t0 + 880);
    t3 = *((char **)t2);
    t13 = xsi_vlog_unsigned_case_compare(t4, 2, t3, 32);
    if (t13 == 1)
        goto LAB17;

LAB18:
LAB20:
LAB19:    xsi_set_current_line(110, ng0);
    t2 = (t0 + 4136);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t11 = (t0 + 4136);
    xsi_vlogvar_wait_assign_value(t11, t5, 0, 0, 2, 0LL);

LAB21:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(103, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 4136);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 2, 0LL);
    goto LAB8;

LAB11:    xsi_set_current_line(106, ng0);
    t5 = ((char*)((ng1)));
    t12 = (t0 + 4136);
    xsi_vlogvar_wait_assign_value(t12, t5, 0, 0, 2, 0LL);
    goto LAB21;

LAB13:    xsi_set_current_line(107, ng0);
    t2 = ((char*)((ng1)));
    t5 = (t0 + 4136);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 2, 0LL);
    goto LAB21;

LAB15:    xsi_set_current_line(108, ng0);
    t2 = ((char*)((ng1)));
    t5 = (t0 + 4136);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 2, 0LL);
    goto LAB21;

LAB17:    xsi_set_current_line(109, ng0);
    t2 = (t0 + 4136);
    t5 = (t2 + 56U);
    t11 = *((char **)t5);
    t12 = ((char*)((ng2)));
    memset(t14, 0, 8);
    xsi_vlog_unsigned_add(t14, 32, t11, 2, t12, 32);
    t15 = (t0 + 4136);
    xsi_vlogvar_wait_assign_value(t15, t14, 0, 0, 2, 0LL);
    goto LAB21;

}

static void Always_116_3(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    int t13;

LAB0:    t1 = (t0 + 6120U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(116, ng0);
    t2 = (t0 + 6984);
    *((int *)t2) = 1;
    t3 = (t0 + 6152);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(117, ng0);

LAB5:    xsi_set_current_line(118, ng0);
    t4 = (t0 + 2136U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(119, ng0);

LAB9:    xsi_set_current_line(120, ng0);
    t2 = (t0 + 3816);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);

LAB10:    t5 = (t0 + 472);
    t11 = *((char **)t5);
    t13 = xsi_vlog_unsigned_case_compare(t4, 2, t11, 32);
    if (t13 == 1)
        goto LAB11;

LAB12:    t2 = (t0 + 608);
    t3 = *((char **)t2);
    t13 = xsi_vlog_unsigned_case_compare(t4, 2, t3, 32);
    if (t13 == 1)
        goto LAB13;

LAB14:    t2 = (t0 + 744);
    t3 = *((char **)t2);
    t13 = xsi_vlog_unsigned_case_compare(t4, 2, t3, 32);
    if (t13 == 1)
        goto LAB15;

LAB16:    t2 = (t0 + 880);
    t3 = *((char **)t2);
    t13 = xsi_vlog_unsigned_case_compare(t4, 2, t3, 32);
    if (t13 == 1)
        goto LAB17;

LAB18:
LAB20:
LAB19:    xsi_set_current_line(130, ng0);
    t2 = (t0 + 4456);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t11 = (t0 + 4456);
    xsi_vlogvar_wait_assign_value(t11, t5, 0, 0, 2, 0LL);

LAB21:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(118, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 4456);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 2, 0LL);
    goto LAB8;

LAB11:    xsi_set_current_line(121, ng0);
    t5 = (t0 + 1016);
    t12 = *((char **)t5);
    t5 = (t0 + 4456);
    xsi_vlogvar_wait_assign_value(t5, t12, 0, 0, 2, 0LL);
    goto LAB21;

LAB13:    xsi_set_current_line(122, ng0);

LAB22:    xsi_set_current_line(123, ng0);
    t2 = (t0 + 2456U);
    t5 = *((char **)t2);
    t2 = (t5 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB23;

LAB24:    xsi_set_current_line(124, ng0);
    t2 = (t0 + 2776U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB26;

LAB27:    xsi_set_current_line(125, ng0);
    t2 = (t0 + 2616U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB29;

LAB30:    xsi_set_current_line(126, ng0);
    t2 = (t0 + 1016);
    t3 = *((char **)t2);
    t2 = (t0 + 4456);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 2, 0LL);

LAB31:
LAB28:
LAB25:    goto LAB21;

LAB15:    xsi_set_current_line(128, ng0);
    t2 = (t0 + 4456);
    t5 = (t2 + 56U);
    t11 = *((char **)t5);
    t12 = (t0 + 4456);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 2, 0LL);
    goto LAB21;

LAB17:    xsi_set_current_line(129, ng0);
    t2 = (t0 + 4456);
    t5 = (t2 + 56U);
    t11 = *((char **)t5);
    t12 = (t0 + 4456);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 2, 0LL);
    goto LAB21;

LAB23:    xsi_set_current_line(123, ng0);
    t11 = (t0 + 1288);
    t12 = *((char **)t11);
    t11 = (t0 + 4456);
    xsi_vlogvar_wait_assign_value(t11, t12, 0, 0, 2, 0LL);
    goto LAB25;

LAB26:    xsi_set_current_line(124, ng0);
    t5 = (t0 + 1152);
    t11 = *((char **)t5);
    t5 = (t0 + 4456);
    xsi_vlogvar_wait_assign_value(t5, t11, 0, 0, 2, 0LL);
    goto LAB28;

LAB29:    xsi_set_current_line(125, ng0);
    t5 = (t0 + 1424);
    t11 = *((char **)t5);
    t5 = (t0 + 4456);
    xsi_vlogvar_wait_assign_value(t5, t11, 0, 0, 2, 0LL);
    goto LAB31;

}

static void Always_136_4(char *t0)
{
    char t15[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    int t13;
    char *t14;

LAB0:    t1 = (t0 + 6368U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(136, ng0);
    t2 = (t0 + 7000);
    *((int *)t2) = 1;
    t3 = (t0 + 6400);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(137, ng0);

LAB5:    xsi_set_current_line(138, ng0);
    t4 = (t0 + 2136U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(139, ng0);

LAB9:    xsi_set_current_line(140, ng0);
    t2 = (t0 + 3816);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);

LAB10:    t5 = (t0 + 472);
    t11 = *((char **)t5);
    t13 = xsi_vlog_unsigned_case_compare(t4, 2, t11, 32);
    if (t13 == 1)
        goto LAB11;

LAB12:    t2 = (t0 + 608);
    t3 = *((char **)t2);
    t13 = xsi_vlog_unsigned_case_compare(t4, 2, t3, 32);
    if (t13 == 1)
        goto LAB13;

LAB14:    t2 = (t0 + 744);
    t3 = *((char **)t2);
    t13 = xsi_vlog_unsigned_case_compare(t4, 2, t3, 32);
    if (t13 == 1)
        goto LAB15;

LAB16:    t2 = (t0 + 880);
    t3 = *((char **)t2);
    t13 = xsi_vlog_unsigned_case_compare(t4, 2, t3, 32);
    if (t13 == 1)
        goto LAB17;

LAB18:
LAB20:
LAB19:    xsi_set_current_line(145, ng0);
    t2 = (t0 + 4296);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t11 = (t0 + 4296);
    xsi_vlogvar_wait_assign_value(t11, t5, 0, 0, 8, 0LL);

LAB21:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(138, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 4296);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 8, 0LL);
    goto LAB8;

LAB11:    xsi_set_current_line(141, ng0);
    t5 = ((char*)((ng1)));
    t12 = (t0 + 4296);
    xsi_vlogvar_wait_assign_value(t12, t5, 0, 0, 8, 0LL);
    goto LAB21;

LAB13:    xsi_set_current_line(142, ng0);
    t2 = (t0 + 4296);
    t5 = (t2 + 56U);
    t11 = *((char **)t5);
    t12 = (t0 + 2936U);
    t14 = *((char **)t12);
    memset(t15, 0, 8);
    xsi_vlog_unsigned_add(t15, 8, t11, 8, t14, 4);
    t12 = (t0 + 4296);
    xsi_vlogvar_wait_assign_value(t12, t15, 0, 0, 8, 0LL);
    goto LAB21;

LAB15:    xsi_set_current_line(143, ng0);
    t2 = (t0 + 4296);
    t5 = (t2 + 56U);
    t11 = *((char **)t5);
    t12 = (t0 + 4296);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 8, 0LL);
    goto LAB21;

LAB17:    xsi_set_current_line(144, ng0);
    t2 = (t0 + 4296);
    t5 = (t2 + 56U);
    t11 = *((char **)t5);
    t12 = (t0 + 4296);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 8, 0LL);
    goto LAB21;

}

static void Always_151_5(char *t0)
{
    char t14[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    int t13;
    char *t15;
    int t16;
    char *t17;

LAB0:    t1 = (t0 + 6616U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(151, ng0);
    t2 = (t0 + 7016);
    *((int *)t2) = 1;
    t3 = (t0 + 6648);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(152, ng0);

LAB5:    xsi_set_current_line(153, ng0);
    t4 = (t0 + 2136U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(154, ng0);

LAB9:    xsi_set_current_line(155, ng0);
    t2 = (t0 + 3816);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);

LAB10:    t5 = (t0 + 472);
    t11 = *((char **)t5);
    t13 = xsi_vlog_unsigned_case_compare(t4, 2, t11, 32);
    if (t13 == 1)
        goto LAB11;

LAB12:    t2 = (t0 + 608);
    t3 = *((char **)t2);
    t13 = xsi_vlog_unsigned_case_compare(t4, 2, t3, 32);
    if (t13 == 1)
        goto LAB13;

LAB14:    t2 = (t0 + 744);
    t3 = *((char **)t2);
    t13 = xsi_vlog_unsigned_case_compare(t4, 2, t3, 32);
    if (t13 == 1)
        goto LAB15;

LAB16:    t2 = (t0 + 880);
    t3 = *((char **)t2);
    t13 = xsi_vlog_unsigned_case_compare(t4, 2, t3, 32);
    if (t13 == 1)
        goto LAB17;

LAB18:
LAB20:
LAB19:    xsi_set_current_line(168, ng0);
    t2 = (t0 + 3496);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t12 = (t0 + 3496);
    xsi_vlogvar_wait_assign_value(t12, t5, 0, 0, 8, 0LL);

LAB21:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(153, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 3496);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 8, 0LL);
    goto LAB8;

LAB11:    xsi_set_current_line(156, ng0);
    t5 = (t0 + 2936U);
    t12 = *((char **)t5);
    memcpy(t14, t12, 8);
    t5 = (t0 + 3496);
    xsi_vlogvar_wait_assign_value(t5, t14, 0, 0, 8, 0LL);
    goto LAB21;

LAB13:    xsi_set_current_line(157, ng0);
    t2 = (t0 + 3496);
    t5 = (t2 + 56U);
    t11 = *((char **)t5);
    t12 = (t0 + 3496);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 8, 0LL);
    goto LAB21;

LAB15:    xsi_set_current_line(158, ng0);

LAB22:    xsi_set_current_line(159, ng0);
    t2 = (t0 + 4456);
    t5 = (t2 + 56U);
    t11 = *((char **)t5);

LAB23:    t12 = (t0 + 1016);
    t15 = *((char **)t12);
    t16 = xsi_vlog_unsigned_case_compare(t11, 2, t15, 32);
    if (t16 == 1)
        goto LAB24;

LAB25:    t2 = (t0 + 1152);
    t3 = *((char **)t2);
    t13 = xsi_vlog_unsigned_case_compare(t11, 2, t3, 32);
    if (t13 == 1)
        goto LAB26;

LAB27:    t2 = (t0 + 1424);
    t3 = *((char **)t2);
    t13 = xsi_vlog_unsigned_case_compare(t11, 2, t3, 32);
    if (t13 == 1)
        goto LAB28;

LAB29:    t2 = (t0 + 1288);
    t3 = *((char **)t2);
    t13 = xsi_vlog_unsigned_case_compare(t11, 2, t3, 32);
    if (t13 == 1)
        goto LAB30;

LAB31:
LAB33:
LAB32:    xsi_set_current_line(164, ng0);
    t2 = (t0 + 3496);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t12 = (t0 + 3496);
    xsi_vlogvar_wait_assign_value(t12, t5, 0, 0, 8, 0LL);

LAB34:    goto LAB21;

LAB17:    xsi_set_current_line(167, ng0);
    t2 = (t0 + 3496);
    t5 = (t2 + 56U);
    t12 = *((char **)t5);
    t15 = (t0 + 3496);
    xsi_vlogvar_wait_assign_value(t15, t12, 0, 0, 8, 0LL);
    goto LAB21;

LAB24:    xsi_set_current_line(160, ng0);
    t12 = (t0 + 2936U);
    t17 = *((char **)t12);
    memcpy(t14, t17, 8);
    t12 = (t0 + 3496);
    xsi_vlogvar_wait_assign_value(t12, t14, 0, 0, 8, 0LL);
    goto LAB34;

LAB26:    xsi_set_current_line(161, ng0);
    t2 = (t0 + 4296);
    t5 = (t2 + 56U);
    t12 = *((char **)t5);
    t15 = (t0 + 2936U);
    t17 = *((char **)t15);
    memset(t14, 0, 8);
    xsi_vlog_unsigned_add(t14, 8, t12, 8, t17, 4);
    t15 = (t0 + 3496);
    xsi_vlogvar_wait_assign_value(t15, t14, 0, 0, 8, 0LL);
    goto LAB34;

LAB28:    xsi_set_current_line(162, ng0);
    t2 = (t0 + 4296);
    t5 = (t2 + 56U);
    t12 = *((char **)t5);
    t15 = (t0 + 2936U);
    t17 = *((char **)t15);
    memset(t14, 0, 8);
    xsi_vlog_unsigned_multiply(t14, 8, t12, 8, t17, 4);
    t15 = (t0 + 3496);
    xsi_vlogvar_wait_assign_value(t15, t14, 0, 0, 8, 0LL);
    goto LAB34;

LAB30:    xsi_set_current_line(163, ng0);
    t2 = (t0 + 3096U);
    t5 = *((char **)t2);
    memcpy(t14, t5, 8);
    t2 = (t0 + 3496);
    xsi_vlogvar_wait_assign_value(t2, t14, 0, 0, 8, 0LL);
    goto LAB34;

}


extern void work_m_00000000001727352061_3501928705_init()
{
	static char *pe[] = {(void *)Always_72_0,(void *)Always_79_1,(void *)Always_101_2,(void *)Always_116_3,(void *)Always_136_4,(void *)Always_151_5};
	xsi_register_didat("work_m_00000000001727352061_3501928705", "isim/lab07_0416037_isim_beh.exe.sim/work/m_00000000001727352061_3501928705.didat");
	xsi_register_executes(pe);
}
