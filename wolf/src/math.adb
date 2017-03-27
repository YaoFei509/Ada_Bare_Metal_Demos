------------------------------------------------------------------------------
--                        Bareboard drivers examples                        --
--                                                                          --
--                     Copyright (C) 2015-2017, AdaCore                     --
--                                                                          --
-- This library is free software;  you can redistribute it and/or modify it --
-- under terms of the  GNU General Public License  as published by the Free --
-- Software  Foundation;  either version 3,  or (at your  option) any later --
-- version. This library is distributed in the hope that it will be useful, --
-- but WITHOUT ANY WARRANTY;  without even the implied warranty of MERCHAN- --
-- TABILITY or FITNESS FOR A PARTICULAR PURPOSE.                            --
--                                                                          --
-- As a special exception under Section 7 of GPL version 3, you are granted --
-- additional permissions described in the GCC Runtime Library Exception,   --
-- version 3.1, as published by the Free Software Foundation.               --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
------------------------------------------------------------------------------

--  We don't rely here on the Mathematical library of the ravenscar-full
--  runtime as we want to provide math services also for the ravenscar-sfp.

package body Math is

   Quadrant : constant array (Degree range <>) of Float :=
                 (0 => 0.0000000000,
                  1 => 0.0017453284,
                  2 => 0.0034906514,
                  3 => 0.0052359638,
                  4 => 0.0069812603,
                  5 => 0.0087265355,
                  6 => 0.0104717841,
                  7 => 0.0122170008,
                  8 => 0.0139621803,
                  9 => 0.0157073173,
                  10 => 0.0174524064,
                  11 => 0.0191974424,
                  12 => 0.0209424199,
                  13 => 0.0226873336,
                  14 => 0.0244321782,
                  15 => 0.0261769483,
                  16 => 0.0279216387,
                  17 => 0.0296662441,
                  18 => 0.0314107591,
                  19 => 0.0331551784,
                  20 => 0.0348994967,
                  21 => 0.0366437087,
                  22 => 0.0383878091,
                  23 => 0.0401317925,
                  24 => 0.0418756537,
                  25 => 0.0436193874,
                  26 => 0.0453629881,
                  27 => 0.0471064507,
                  28 => 0.0488497698,
                  29 => 0.0505929401,
                  30 => 0.0523359562,
                  31 => 0.0540788130,
                  32 => 0.0558215050,
                  33 => 0.0575640270,
                  34 => 0.0593063736,
                  35 => 0.0610485395,
                  36 => 0.0627905195,
                  37 => 0.0645323083,
                  38 => 0.0662739004,
                  39 => 0.0680152907,
                  40 => 0.0697564737,
                  41 => 0.0714974443,
                  42 => 0.0732381971,
                  43 => 0.0749787268,
                  44 => 0.0767190281,
                  45 => 0.0784590957,
                  46 => 0.0801989243,
                  47 => 0.0819385086,
                  48 => 0.0836778433,
                  49 => 0.0854169231,
                  50 => 0.0871557427,
                  51 => 0.0888942969,
                  52 => 0.0906325802,
                  53 => 0.0923705874,
                  54 => 0.0941083133,
                  55 => 0.0958457525,
                  56 => 0.0975828998,
                  57 => 0.0993197497,
                  58 => 0.1010562972,
                  59 => 0.1027925368,
                  60 => 0.1045284633,
                  61 => 0.1062640713,
                  62 => 0.1079993557,
                  63 => 0.1097343111,
                  64 => 0.1114689322,
                  65 => 0.1132032138,
                  66 => 0.1149371505,
                  67 => 0.1166707371,
                  68 => 0.1184039683,
                  69 => 0.1201368388,
                  70 => 0.1218693434,
                  71 => 0.1236014767,
                  72 => 0.1253332336,
                  73 => 0.1270646086,
                  74 => 0.1287955966,
                  75 => 0.1305261922,
                  76 => 0.1322563903,
                  77 => 0.1339861854,
                  78 => 0.1357155724,
                  79 => 0.1374445460,
                  80 => 0.1391731010,
                  81 => 0.1409012319,
                  82 => 0.1426289337,
                  83 => 0.1443562010,
                  84 => 0.1460830286,
                  85 => 0.1478094111,
                  86 => 0.1495353434,
                  87 => 0.1512608202,
                  88 => 0.1529858363,
                  89 => 0.1547103863,
                  90 => 0.1564344650,
                  91 => 0.1581580673,
                  92 => 0.1598811877,
                  93 => 0.1616038211,
                  94 => 0.1633259622,
                  95 => 0.1650476059,
                  96 => 0.1667687467,
                  97 => 0.1684893796,
                  98 => 0.1702094992,
                  99 => 0.1719291003,
                  100 => 0.1736481777,
                  101 => 0.1753667261,
                  102 => 0.1770847403,
                  103 => 0.1788022151,
                  104 => 0.1805191453,
                  105 => 0.1822355255,
                  106 => 0.1839513506,
                  107 => 0.1856666154,
                  108 => 0.1873813146,
                  109 => 0.1890954430,
                  110 => 0.1908089954,
                  111 => 0.1925219665,
                  112 => 0.1942343512,
                  113 => 0.1959461442,
                  114 => 0.1976573404,
                  115 => 0.1993679344,
                  116 => 0.2010779211,
                  117 => 0.2027872954,
                  118 => 0.2044960518,
                  119 => 0.2062041854,
                  120 => 0.2079116908,
                  121 => 0.2096185629,
                  122 => 0.2113247965,
                  123 => 0.2130303863,
                  124 => 0.2147353272,
                  125 => 0.2164396139,
                  126 => 0.2181432414,
                  127 => 0.2198462044,
                  128 => 0.2215484976,
                  129 => 0.2232501160,
                  130 => 0.2249510543,
                  131 => 0.2266513074,
                  132 => 0.2283508701,
                  133 => 0.2300497372,
                  134 => 0.2317479035,
                  135 => 0.2334453639,
                  136 => 0.2351421131,
                  137 => 0.2368381461,
                  138 => 0.2385334576,
                  139 => 0.2402280425,
                  140 => 0.2419218956,
                  141 => 0.2436150118,
                  142 => 0.2453073859,
                  143 => 0.2469990127,
                  144 => 0.2486898872,
                  145 => 0.2503800041,
                  146 => 0.2520693582,
                  147 => 0.2537579446,
                  148 => 0.2554457579,
                  149 => 0.2571327932,
                  150 => 0.2588190451,
                  151 => 0.2605045086,
                  152 => 0.2621891786,
                  153 => 0.2638730500,
                  154 => 0.2655561175,
                  155 => 0.2672383761,
                  156 => 0.2689198206,
                  157 => 0.2706004460,
                  158 => 0.2722802470,
                  159 => 0.2739592187,
                  160 => 0.2756373558,
                  161 => 0.2773146533,
                  162 => 0.2789911060,
                  163 => 0.2806667089,
                  164 => 0.2823414568,
                  165 => 0.2840153447,
                  166 => 0.2856883674,
                  167 => 0.2873605198,
                  168 => 0.2890317969,
                  169 => 0.2907021936,
                  170 => 0.2923717047,
                  171 => 0.2940403252,
                  172 => 0.2957080500,
                  173 => 0.2973748741,
                  174 => 0.2990407923,
                  175 => 0.3007057995,
                  176 => 0.3023698908,
                  177 => 0.3040330609,
                  178 => 0.3056953050,
                  179 => 0.3073566178,
                  180 => 0.3090169944,
                  181 => 0.3106764296,
                  182 => 0.3123349185,
                  183 => 0.3139924560,
                  184 => 0.3156490369,
                  185 => 0.3173046564,
                  186 => 0.3189593093,
                  187 => 0.3206129906,
                  188 => 0.3222656952,
                  189 => 0.3239174182,
                  190 => 0.3255681545,
                  191 => 0.3272178990,
                  192 => 0.3288666467,
                  193 => 0.3305143927,
                  194 => 0.3321611319,
                  195 => 0.3338068592,
                  196 => 0.3354515698,
                  197 => 0.3370952584,
                  198 => 0.3387379202,
                  199 => 0.3403795502,
                  200 => 0.3420201433,
                  201 => 0.3436596946,
                  202 => 0.3452981990,
                  203 => 0.3469356516,
                  204 => 0.3485720473,
                  205 => 0.3502073813,
                  206 => 0.3518416484,
                  207 => 0.3534748438,
                  208 => 0.3551069624,
                  209 => 0.3567379993,
                  210 => 0.3583679495,
                  211 => 0.3599968081,
                  212 => 0.3616245701,
                  213 => 0.3632512305,
                  214 => 0.3648767843,
                  215 => 0.3665012267,
                  216 => 0.3681245527,
                  217 => 0.3697467573,
                  218 => 0.3713678356,
                  219 => 0.3729877826,
                  220 => 0.3746065934,
                  221 => 0.3762242631,
                  222 => 0.3778407868,
                  223 => 0.3794561595,
                  224 => 0.3810703764,
                  225 => 0.3826834324,
                  226 => 0.3842953227,
                  227 => 0.3859060423,
                  228 => 0.3875155865,
                  229 => 0.3891239501,
                  230 => 0.3907311285,
                  231 => 0.3923371166,
                  232 => 0.3939419096,
                  233 => 0.3955455026,
                  234 => 0.3971478906,
                  235 => 0.3987490689,
                  236 => 0.4003490326,
                  237 => 0.4019477767,
                  238 => 0.4035452964,
                  239 => 0.4051415868,
                  240 => 0.4067366431,
                  241 => 0.4083304604,
                  242 => 0.4099230338,
                  243 => 0.4115143586,
                  244 => 0.4131044298,
                  245 => 0.4146932427,
                  246 => 0.4162807923,
                  247 => 0.4178670738,
                  248 => 0.4194520824,
                  249 => 0.4210358134,
                  250 => 0.4226182617,
                  251 => 0.4241994227,
                  252 => 0.4257792916,
                  253 => 0.4273578634,
                  254 => 0.4289351334,
                  255 => 0.4305110968,
                  256 => 0.4320857488,
                  257 => 0.4336590846,
                  258 => 0.4352310994,
                  259 => 0.4368017884,
                  260 => 0.4383711468,
                  261 => 0.4399391699,
                  262 => 0.4415058528,
                  263 => 0.4430711908,
                  264 => 0.4446351792,
                  265 => 0.4461978131,
                  266 => 0.4477590878,
                  267 => 0.4493189986,
                  268 => 0.4508775407,
                  269 => 0.4524347093,
                  270 => 0.4539904997,
                  271 => 0.4555449072,
                  272 => 0.4570979271,
                  273 => 0.4586495545,
                  274 => 0.4601997848,
                  275 => 0.4617486132,
                  276 => 0.4632960351,
                  277 => 0.4648420457,
                  278 => 0.4663866403,
                  279 => 0.4679298143,
                  280 => 0.4694715628,
                  281 => 0.4710118812,
                  282 => 0.4725507649,
                  283 => 0.4740882090,
                  284 => 0.4756242091,
                  285 => 0.4771587603,
                  286 => 0.4786918579,
                  287 => 0.4802234974,
                  288 => 0.4817536741,
                  289 => 0.4832823833,
                  290 => 0.4848096202,
                  291 => 0.4863353804,
                  292 => 0.4878596591,
                  293 => 0.4893824517,
                  294 => 0.4909037536,
                  295 => 0.4924235601,
                  296 => 0.4939418666,
                  297 => 0.4954586684,
                  298 => 0.4969739610,
                  299 => 0.4984877398,
                  300 => 0.5000000000,
                  301 => 0.5015107372,
                  302 => 0.5030199466,
                  303 => 0.5045276238,
                  304 => 0.5060337641,
                  305 => 0.5075383630,
                  306 => 0.5090414158,
                  307 => 0.5105429179,
                  308 => 0.5120428649,
                  309 => 0.5135412521,
                  310 => 0.5150380749,
                  311 => 0.5165333289,
                  312 => 0.5180270094,
                  313 => 0.5195191119,
                  314 => 0.5210096318,
                  315 => 0.5224985647,
                  316 => 0.5239859060,
                  317 => 0.5254716511,
                  318 => 0.5269557955,
                  319 => 0.5284383347,
                  320 => 0.5299192642,
                  321 => 0.5313985795,
                  322 => 0.5328762761,
                  323 => 0.5343523494,
                  324 => 0.5358267950,
                  325 => 0.5372996083,
                  326 => 0.5387707850,
                  327 => 0.5402403205,
                  328 => 0.5417082103,
                  329 => 0.5431744500,
                  330 => 0.5446390350,
                  331 => 0.5461019610,
                  332 => 0.5475632235,
                  333 => 0.5490228180,
                  334 => 0.5504807401,
                  335 => 0.5519369853,
                  336 => 0.5533915492,
                  337 => 0.5548444274,
                  338 => 0.5562956155,
                  339 => 0.5577451090,
                  340 => 0.5591929035,
                  341 => 0.5606389946,
                  342 => 0.5620833779,
                  343 => 0.5635260489,
                  344 => 0.5649670034,
                  345 => 0.5664062369,
                  346 => 0.5678437451,
                  347 => 0.5692795234,
                  348 => 0.5707135677,
                  349 => 0.5721458734,
                  350 => 0.5735764364,
                  351 => 0.5750052520,
                  352 => 0.5764323162,
                  353 => 0.5778576244,
                  354 => 0.5792811723,
                  355 => 0.5807029557,
                  356 => 0.5821229702,
                  357 => 0.5835412114,
                  358 => 0.5849576750,
                  359 => 0.5863723567,
                  360 => 0.5877852523,
                  361 => 0.5891963574,
                  362 => 0.5906056676,
                  363 => 0.5920131788,
                  364 => 0.5934188866,
                  365 => 0.5948227868,
                  366 => 0.5962248750,
                  367 => 0.5976251470,
                  368 => 0.5990235985,
                  369 => 0.6004202253,
                  370 => 0.6018150232,
                  371 => 0.6032079877,
                  372 => 0.6045991149,
                  373 => 0.6059884003,
                  374 => 0.6073758397,
                  375 => 0.6087614290,
                  376 => 0.6101451639,
                  377 => 0.6115270402,
                  378 => 0.6129070537,
                  379 => 0.6142852001,
                  380 => 0.6156614753,
                  381 => 0.6170358751,
                  382 => 0.6184083954,
                  383 => 0.6197790318,
                  384 => 0.6211477803,
                  385 => 0.6225146366,
                  386 => 0.6238795967,
                  387 => 0.6252426563,
                  388 => 0.6266038114,
                  389 => 0.6279630576,
                  390 => 0.6293203910,
                  391 => 0.6306758074,
                  392 => 0.6320293027,
                  393 => 0.6333808726,
                  394 => 0.6347305132,
                  395 => 0.6360782203,
                  396 => 0.6374239897,
                  397 => 0.6387678175,
                  398 => 0.6401096995,
                  399 => 0.6414496316,
                  400 => 0.6427876097,
                  401 => 0.6441236298,
                  402 => 0.6454576877,
                  403 => 0.6467897795,
                  404 => 0.6481199011,
                  405 => 0.6494480483,
                  406 => 0.6507742173,
                  407 => 0.6520984038,
                  408 => 0.6534206040,
                  409 => 0.6547408137,
                  410 => 0.6560590290,
                  411 => 0.6573752458,
                  412 => 0.6586894601,
                  413 => 0.6600016680,
                  414 => 0.6613118653,
                  415 => 0.6626200482,
                  416 => 0.6639262127,
                  417 => 0.6652303547,
                  418 => 0.6665324702,
                  419 => 0.6678325555,
                  420 => 0.6691306064,
                  421 => 0.6704266190,
                  422 => 0.6717205893,
                  423 => 0.6730125135,
                  424 => 0.6743023876,
                  425 => 0.6755902076,
                  426 => 0.6768759697,
                  427 => 0.6781596699,
                  428 => 0.6794413043,
                  429 => 0.6807208690,
                  430 => 0.6819983601,
                  431 => 0.6832737737,
                  432 => 0.6845471059,
                  433 => 0.6858183529,
                  434 => 0.6870875108,
                  435 => 0.6883545757,
                  436 => 0.6896195437,
                  437 => 0.6908824111,
                  438 => 0.6921431739,
                  439 => 0.6934018283,
                  440 => 0.6946583705,
                  441 => 0.6959127966,
                  442 => 0.6971651029,
                  443 => 0.6984152854,
                  444 => 0.6996633405,
                  445 => 0.7009092643,
                  446 => 0.7021530530,
                  447 => 0.7033947028,
                  448 => 0.7046342100,
                  449 => 0.7058715707,
                  450 => 0.7071067812,
                  451 => 0.7083398377,
                  452 => 0.7095707365,
                  453 => 0.7107994739,
                  454 => 0.7120260460,
                  455 => 0.7132504492,
                  456 => 0.7144726796,
                  457 => 0.7156927337,
                  458 => 0.7169106077,
                  459 => 0.7181262978,
                  460 => 0.7193398003,
                  461 => 0.7205511117,
                  462 => 0.7217602281,
                  463 => 0.7229671459,
                  464 => 0.7241718614,
                  465 => 0.7253743710,
                  466 => 0.7265746710,
                  467 => 0.7277727577,
                  468 => 0.7289686274,
                  469 => 0.7301622766,
                  470 => 0.7313537016,
                  471 => 0.7325428988,
                  472 => 0.7337298645,
                  473 => 0.7349145951,
                  474 => 0.7360970871,
                  475 => 0.7372773368,
                  476 => 0.7384553406,
                  477 => 0.7396310950,
                  478 => 0.7408045963,
                  479 => 0.7419758410,
                  480 => 0.7431448255,
                  481 => 0.7443115462,
                  482 => 0.7454759997,
                  483 => 0.7466381823,
                  484 => 0.7477980905,
                  485 => 0.7489557208,
                  486 => 0.7501110696,
                  487 => 0.7512641335,
                  488 => 0.7524149089,
                  489 => 0.7535633923,
                  490 => 0.7547095802,
                  491 => 0.7558534692,
                  492 => 0.7569950557,
                  493 => 0.7581343362,
                  494 => 0.7592713073,
                  495 => 0.7604059656,
                  496 => 0.7615383075,
                  497 => 0.7626683297,
                  498 => 0.7637960286,
                  499 => 0.7649214009,
                  500 => 0.7660444431,
                  501 => 0.7671651518,
                  502 => 0.7682835236,
                  503 => 0.7693995550,
                  504 => 0.7705132428,
                  505 => 0.7716245834,
                  506 => 0.7727335735,
                  507 => 0.7738402097,
                  508 => 0.7749444887,
                  509 => 0.7760464071,
                  510 => 0.7771459615,
                  511 => 0.7782431485,
                  512 => 0.7793379649,
                  513 => 0.7804304073,
                  514 => 0.7815204724,
                  515 => 0.7826081569,
                  516 => 0.7836934573,
                  517 => 0.7847763705,
                  518 => 0.7858568932,
                  519 => 0.7869350220,
                  520 => 0.7880107536,
                  521 => 0.7890840848,
                  522 => 0.7901550124,
                  523 => 0.7912235330,
                  524 => 0.7922896434,
                  525 => 0.7933533403,
                  526 => 0.7944146205,
                  527 => 0.7954734809,
                  528 => 0.7965299180,
                  529 => 0.7975839288,
                  530 => 0.7986355100,
                  531 => 0.7996846585,
                  532 => 0.8007313709,
                  533 => 0.8017756442,
                  534 => 0.8028174752,
                  535 => 0.8038568606,
                  536 => 0.8048937974,
                  537 => 0.8059282822,
                  538 => 0.8069603121,
                  539 => 0.8079898839,
                  540 => 0.8090169944,
                  541 => 0.8100416404,
                  542 => 0.8110638190,
                  543 => 0.8120835269,
                  544 => 0.8131007610,
                  545 => 0.8141155184,
                  546 => 0.8151277957,
                  547 => 0.8161375901,
                  548 => 0.8171448983,
                  549 => 0.8181497174,
                  550 => 0.8191520443,
                  551 => 0.8201518759,
                  552 => 0.8211492091,
                  553 => 0.8221440410,
                  554 => 0.8231363685,
                  555 => 0.8241261886,
                  556 => 0.8251134983,
                  557 => 0.8260982945,
                  558 => 0.8270805743,
                  559 => 0.8280603346,
                  560 => 0.8290375726,
                  561 => 0.8300122851,
                  562 => 0.8309844693,
                  563 => 0.8319541221,
                  564 => 0.8329212407,
                  565 => 0.8338858221,
                  566 => 0.8348478633,
                  567 => 0.8358073614,
                  568 => 0.8367643135,
                  569 => 0.8377187166,
                  570 => 0.8386705679,
                  571 => 0.8396198645,
                  572 => 0.8405666035,
                  573 => 0.8415107819,
                  574 => 0.8424523970,
                  575 => 0.8433914458,
                  576 => 0.8443279255,
                  577 => 0.8452618332,
                  578 => 0.8461931661,
                  579 => 0.8471219214,
                  580 => 0.8480480962,
                  581 => 0.8489716876,
                  582 => 0.8498926930,
                  583 => 0.8508111094,
                  584 => 0.8517269341,
                  585 => 0.8526401644,
                  586 => 0.8535507973,
                  587 => 0.8544588301,
                  588 => 0.8553642602,
                  589 => 0.8562670846,
                  590 => 0.8571673007,
                  591 => 0.8580649057,
                  592 => 0.8589598969,
                  593 => 0.8598522716,
                  594 => 0.8607420270,
                  595 => 0.8616291604,
                  596 => 0.8625136692,
                  597 => 0.8633955506,
                  598 => 0.8642748020,
                  599 => 0.8651514206,
                  600 => 0.8660254038,
                  601 => 0.8668967489,
                  602 => 0.8677654534,
                  603 => 0.8686315144,
                  604 => 0.8694949295,
                  605 => 0.8703556959,
                  606 => 0.8712138111,
                  607 => 0.8720692724,
                  608 => 0.8729220773,
                  609 => 0.8737722230,
                  610 => 0.8746197071,
                  611 => 0.8754645270,
                  612 => 0.8763066800,
                  613 => 0.8771461637,
                  614 => 0.8779829754,
                  615 => 0.8788171127,
                  616 => 0.8796485729,
                  617 => 0.8804773535,
                  618 => 0.8813034521,
                  619 => 0.8821268660,
                  620 => 0.8829475929,
                  621 => 0.8837656301,
                  622 => 0.8845809752,
                  623 => 0.8853936258,
                  624 => 0.8862035792,
                  625 => 0.8870108332,
                  626 => 0.8878153851,
                  627 => 0.8886172327,
                  628 => 0.8894163733,
                  629 => 0.8902128046,
                  630 => 0.8910065242,
                  631 => 0.8917975296,
                  632 => 0.8925858185,
                  633 => 0.8933713883,
                  634 => 0.8941542368,
                  635 => 0.8949343616,
                  636 => 0.8957117602,
                  637 => 0.8964864304,
                  638 => 0.8972583697,
                  639 => 0.8980275758,
                  640 => 0.8987940463,
                  641 => 0.8995577790,
                  642 => 0.9003187714,
                  643 => 0.9010770213,
                  644 => 0.9018325264,
                  645 => 0.9025852843,
                  646 => 0.9033352929,
                  647 => 0.9040825497,
                  648 => 0.9048270525,
                  649 => 0.9055687990,
                  650 => 0.9063077870,
                  651 => 0.9070440143,
                  652 => 0.9077774785,
                  653 => 0.9085081775,
                  654 => 0.9092361090,
                  655 => 0.9099612709,
                  656 => 0.9106836608,
                  657 => 0.9114032766,
                  658 => 0.9121201162,
                  659 => 0.9128341772,
                  660 => 0.9135454576,
                  661 => 0.9142539552,
                  662 => 0.9149596678,
                  663 => 0.9156625933,
                  664 => 0.9163627296,
                  665 => 0.9170600744,
                  666 => 0.9177546257,
                  667 => 0.9184463813,
                  668 => 0.9191353393,
                  669 => 0.9198214973,
                  670 => 0.9205048535,
                  671 => 0.9211854056,
                  672 => 0.9218631516,
                  673 => 0.9225380895,
                  674 => 0.9232102171,
                  675 => 0.9238795325,
                  676 => 0.9245460336,
                  677 => 0.9252097184,
                  678 => 0.9258705848,
                  679 => 0.9265286309,
                  680 => 0.9271838546,
                  681 => 0.9278362539,
                  682 => 0.9284858269,
                  683 => 0.9291325715,
                  684 => 0.9297764859,
                  685 => 0.9304175680,
                  686 => 0.9310558159,
                  687 => 0.9316912276,
                  688 => 0.9323238012,
                  689 => 0.9329535348,
                  690 => 0.9335804265,
                  691 => 0.9342044743,
                  692 => 0.9348256764,
                  693 => 0.9354440308,
                  694 => 0.9360595357,
                  695 => 0.9366721892,
                  696 => 0.9372819895,
                  697 => 0.9378889346,
                  698 => 0.9384930228,
                  699 => 0.9390942521,
                  700 => 0.9396926208,
                  701 => 0.9402881270,
                  702 => 0.9408807690,
                  703 => 0.9414705448,
                  704 => 0.9420574528,
                  705 => 0.9426414911,
                  706 => 0.9432226579,
                  707 => 0.9438009516,
                  708 => 0.9443763702,
                  709 => 0.9449489122,
                  710 => 0.9455185756,
                  711 => 0.9460853588,
                  712 => 0.9466492601,
                  713 => 0.9472102777,
                  714 => 0.9477684100,
                  715 => 0.9483236552,
                  716 => 0.9488760116,
                  717 => 0.9494254776,
                  718 => 0.9499720515,
                  719 => 0.9505157316,
                  720 => 0.9510565163,
                  721 => 0.9515944039,
                  722 => 0.9521293927,
                  723 => 0.9526614813,
                  724 => 0.9531906678,
                  725 => 0.9537169507,
                  726 => 0.9542403285,
                  727 => 0.9547607995,
                  728 => 0.9552783621,
                  729 => 0.9557930148,
                  730 => 0.9563047560,
                  731 => 0.9568135841,
                  732 => 0.9573194975,
                  733 => 0.9578224948,
                  734 => 0.9583225745,
                  735 => 0.9588197349,
                  736 => 0.9593139745,
                  737 => 0.9598052920,
                  738 => 0.9602936857,
                  739 => 0.9607791542,
                  740 => 0.9612616959,
                  741 => 0.9617413095,
                  742 => 0.9622179935,
                  743 => 0.9626917464,
                  744 => 0.9631625668,
                  745 => 0.9636304532,
                  746 => 0.9640954042,
                  747 => 0.9645574185,
                  748 => 0.9650164945,
                  749 => 0.9654726309,
                  750 => 0.9659258263,
                  751 => 0.9663760793,
                  752 => 0.9668233886,
                  753 => 0.9672677528,
                  754 => 0.9677091705,
                  755 => 0.9681476404,
                  756 => 0.9685831611,
                  757 => 0.9690157314,
                  758 => 0.9694453499,
                  759 => 0.9698720153,
                  760 => 0.9702957263,
                  761 => 0.9707164816,
                  762 => 0.9711342799,
                  763 => 0.9715491200,
                  764 => 0.9719610006,
                  765 => 0.9723699204,
                  766 => 0.9727758782,
                  767 => 0.9731788728,
                  768 => 0.9735789029,
                  769 => 0.9739759673,
                  770 => 0.9743700648,
                  771 => 0.9747611942,
                  772 => 0.9751493543,
                  773 => 0.9755345439,
                  774 => 0.9759167619,
                  775 => 0.9762960071,
                  776 => 0.9766722783,
                  777 => 0.9770455744,
                  778 => 0.9774158943,
                  779 => 0.9777832368,
                  780 => 0.9781476007,
                  781 => 0.9785089851,
                  782 => 0.9788673888,
                  783 => 0.9792228106,
                  784 => 0.9795752496,
                  785 => 0.9799247046,
                  786 => 0.9802711746,
                  787 => 0.9806146585,
                  788 => 0.9809551553,
                  789 => 0.9812926640,
                  790 => 0.9816271834,
                  791 => 0.9819587127,
                  792 => 0.9822872507,
                  793 => 0.9826127965,
                  794 => 0.9829353491,
                  795 => 0.9832549076,
                  796 => 0.9835714708,
                  797 => 0.9838850379,
                  798 => 0.9841956080,
                  799 => 0.9845031800,
                  800 => 0.9848077530,
                  801 => 0.9851093262,
                  802 => 0.9854078985,
                  803 => 0.9857034691,
                  804 => 0.9859960371,
                  805 => 0.9862856015,
                  806 => 0.9865721616,
                  807 => 0.9868557164,
                  808 => 0.9871362651,
                  809 => 0.9874138068,
                  810 => 0.9876883406,
                  811 => 0.9879598658,
                  812 => 0.9882283814,
                  813 => 0.9884938868,
                  814 => 0.9887563810,
                  815 => 0.9890158634,
                  816 => 0.9892723330,
                  817 => 0.9895257891,
                  818 => 0.9897762309,
                  819 => 0.9900236577,
                  820 => 0.9902680687,
                  821 => 0.9905094632,
                  822 => 0.9907478405,
                  823 => 0.9909831997,
                  824 => 0.9912155403,
                  825 => 0.9914448614,
                  826 => 0.9916711624,
                  827 => 0.9918944426,
                  828 => 0.9921147013,
                  829 => 0.9923319379,
                  830 => 0.9925461516,
                  831 => 0.9927573419,
                  832 => 0.9929655081,
                  833 => 0.9931706495,
                  834 => 0.9933727656,
                  835 => 0.9935718557,
                  836 => 0.9937679192,
                  837 => 0.9939609555,
                  838 => 0.9941509640,
                  839 => 0.9943379441,
                  840 => 0.9945218954,
                  841 => 0.9947028171,
                  842 => 0.9948807088,
                  843 => 0.9950555700,
                  844 => 0.9952274000,
                  845 => 0.9953961984,
                  846 => 0.9955619646,
                  847 => 0.9957246982,
                  848 => 0.9958843986,
                  849 => 0.9960410654,
                  850 => 0.9961946981,
                  851 => 0.9963452962,
                  852 => 0.9964928592,
                  853 => 0.9966373868,
                  854 => 0.9967788785,
                  855 => 0.9969173337,
                  856 => 0.9970527522,
                  857 => 0.9971851335,
                  858 => 0.9973144772,
                  859 => 0.9974407829,
                  860 => 0.9975640503,
                  861 => 0.9976842788,
                  862 => 0.9978014683,
                  863 => 0.9979156183,
                  864 => 0.9980267284,
                  865 => 0.9981347984,
                  866 => 0.9982398279,
                  867 => 0.9983418166,
                  868 => 0.9984407642,
                  869 => 0.9985366703,
                  870 => 0.9986295348,
                  871 => 0.9987193572,
                  872 => 0.9988061373,
                  873 => 0.9988898750,
                  874 => 0.9989705698,
                  875 => 0.9990482216,
                  876 => 0.9991228301,
                  877 => 0.9991943951,
                  878 => 0.9992629164,
                  879 => 0.9993283938,
                  880 => 0.9993908270,
                  881 => 0.9994502159,
                  882 => 0.9995065604,
                  883 => 0.9995598601,
                  884 => 0.9996101150,
                  885 => 0.9996573250,
                  886 => 0.9997014898,
                  887 => 0.9997426093,
                  888 => 0.9997806835,
                  889 => 0.9998157121,
                  890 => 0.9998476952,
                  891 => 0.9998766325,
                  892 => 0.9999025240,
                  893 => 0.9999253697,
                  894 => 0.9999451694,
                  895 => 0.9999619231,
                  896 => 0.9999756307,
                  897 => 0.9999862922,
                  898 => 0.9999939077,
                  899 => 0.9999984769,
                  900 => 1.0000000000);

   Cos_Table : array (Degree) of Float;
   Sin_Table : array (Degree) of Float;
   Tan_Table : array (Degree) of Float;

   function Cos (Angle : Degree) return Float is (Cos_Table (Angle));

   function Sin (Angle : Degree) return Float is (Sin_Table (Angle));

   function Tan (Angle : Degree) return Float is (Tan_Table (Angle));

   ------------
   -- Arctan --
   ------------

   function Arctan (F : Float) return Degree
   is
      --  Very dumb version, but OK as we're using it only during init
      A : Degree := 2700; -- -Pi/2
   begin
      while Tan (A) < F loop
         A := A + 1;
      end loop;

      return A;
   end Arctan;

begin

   for J in Degree range 0 .. 899 loop
      Sin_Table (J)        := Quadrant (J);
      Sin_Table (J + 900)  := Quadrant (900 - J);
      Sin_Table (J + 1800) := -Quadrant (J);
      Sin_Table (J + 2700) := -Quadrant (900 - J);

      Cos_Table (J)        := Quadrant (900 - J);
      Cos_Table (J + 900)  := -Quadrant (J);
      Cos_Table (J + 1800) := -Quadrant (900 - J);
      Cos_Table (J + 2700) := Quadrant (J);
   end loop;

   for J in Sin_Table'Range loop
      if Cos_Table (J) = 0.0 then
         Tan_Table (J) := Float'Last;
      end if;

      Tan_Table (J) := Sin_Table (J) / Cos_Table (J);
   end loop;

end Math;