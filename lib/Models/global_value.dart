class Global {
  static double defaultScore = -999;
  static List<String> itemChoiceList = [];
  static List<double> itemChoiceScoreList = [];
  static List<String> examList = [
    "你已经结婚。已婚！3。未婚！0",
    "你和家人之间联系密切，与朋友经常相聚。是的！0.25。没有！0",
    "如何评估你目前的压力水平。较低！0.75。很高！-3",
    "你善于减压。善于！1。不善于！-2",
    "每天的睡眠时间。3~5小时！-1。6小时以上！1",
    "你接受过多少年的正规教育？。16年以上！0.5。低于8年！-0.5",
    "你一周工作多少小时？。低于40！2。40~60小时！1",
    "你对人生逐渐走向衰老，感到乐观还是悲观。乐观！2。悲观！-1",
    "你居住的地方空气质量很好。很好！0.5。不好！0",
    "当你在私家车中，你总是会系好安全带。会的！0.75。不会！0",
    "你每天喝多少杯含有咖啡因的咖啡？。2杯以下！0.5。3杯以上！-0.5",
    "你每天喝2~3杯绿茶。是的！0.5。没有！0",
    "你吸烟或暴露在二手烟的环境。有！-4。无！0",
    "你每天都吸烟。是的！-0.5。没有！0",
    "你每天吸多少支烟？。少于10支【含0】！0。多余15支！-10",
    "你每天饮用啤酒超过3杯，或含酒精的饮品超过3杯，或4杯白酒。是的！-7。没有！0",
    "你每天服用一片阿司匹林？。有的！2。没有！0",
    "阳光下你会涂抹防晒油来保护皮肤吗？。很少！-1。会做好防护！0.5",
    "你有从事危险性行为，或者注射违法药物。没有！10。有的！0",
    "你每天都用牙线洁牙吗？。是的！1。不是！-1",
    "你一周吃多少次快餐和熟食。从来不吃！4。5次以上！-2",
    "你很少吃烧烤的鱼，家禽或肉类。很少吃！1。经常吃！0",
    "你每天会补充钙。会的！0.5。没有！0",
    "如果在正餐之间吃零食，通常你会选择干果。会的！0.5。不会！0",
    "你常吃大量的甜食，如冰淇淋，蛋糕，糖果等。经常吃！-1。很少吃！0",
    "我每天都吃得很多，肥胖。是的！-5。不是！0",
    "你会把铁作为营养素的一部分来补充。会的！0。不会！2",
    "你一周有多少天能达到至少锻炼30分钟？。三天及以上！3。很少锻炼！-1",
    "你排便是否规律。很有规律！0。没有规律！-0.5",
    "你的总胆固醇水平高于180mg/dl(5mmol/L)。符合！-2。不符合！0",
    "你心脏的收缩压是多少？。低于120！2。高于230！-10",
    "你心脏的舒张压低于80。低于80！7。高于80！0",
    "你每年都做血糖检测。是的！0.5。没有！0",
    "你的心脏病两年前发作过，但后来也没有采取任何措施来预防它再次发作。符合！-2。不符合！0",
    "你的直系亲属中从来没有患有糖尿病者或心脏病者。是的！-2。不是！0",
    "直系亲属中有三位或更多的人患有癌症。有！-1。没有！0",
    "你母亲或者奶奶活到90岁以上。是的！2。没有！0",
    "你父亲或者爷爷活到90岁以上。是的！2。没有！0",
    "你的祖父母或曾祖父母中有达到或超过98岁高龄的。是的！2。没有！0",
    "你没有借助任何人工生育手段生育最后一个孩子时是多少岁？。35~43岁！2。其他！0"
  ];
  static List<String> dayWordList = [
    "拼搏改变命运，励志照亮人生。",
    "为了最好的结果，让我们把疯狂进行到底。",
    "当今之世，舍我其谁！",
    "有志者，事竟成，破釜沉舟，百二秦关终属楚；苦心人，天不负，卧薪尝胆，三千越甲可吞吴。",
    "把命运掌握在自己手中。",
    "无情岁月增中减，有味青春苦甜。集雄心壮志，创锦绣前程。",
    "只有流过血的手指，才能弹出世间的绝唱；只有经历地狱般的磨练，才能炼出创造天堂的力量。",
    "登高山，务攻绝顶；赏大雪，莫畏严寒。",
    "我努力，我坚持，我一定能成功。",
    "闻鸡起舞，成就拼搏劲旅师；天道酬勤，再现辉煌王者风。",
    "拥有梦想只是一种智力，实现梦想才是一种能力。",
    "挥洒斗志，成就梦想。",
    "卧薪尝胆，尝破茧而触痛。破釜沉舟，圆金色六月梦。",
    "站在新起点，迎接新挑战，创造新成绩。",
    "拼一个秋冬春夏！赢一生无怨无悔！",
    "失败的尽头是成功努力的终点是辉煌。",
    "十年寒窗磨一剑，是非成败在今朝。",
    "点燃青春激情，实现人生梦想！",
    "一份信心，一份努力，一份成功；十分信心，十分努力，十分成功。",
    "不经三思不求教不动笔墨不读书，人生难得几回搏，此时不搏，何时搏。",
    "青霄有路终须到，金榜无名誓不休。",
    "贵有恒，何须三更起五更眠；最无益，莫过一日曝十日寒。",
    "态度决定一切。细节决定成败，习惯成就人生。",
    "风雨夏秋冬，十年磨一剑。用我们自己的智慧成就梦想。",
    "挑战极限，无悔人生。奋力拼搏进取，谱写风华篇章。",
    "让刻苦成为习惯，用汗水浇灌未来。",
    "拼一个春夏秋冬，换一生无怨无悔。",
    "行动是理想最高贵的表达。",
    "成功是别人失败时还在坚持。",
    "胜人者智，胜之者强。不是成功离我们太远，而是我们坚持的太少。",
    "遇到困难时不要抱怨，既然改变不了过去，那么就努力改变未来。",
    "Everything is possible。",
    "励志创造人生，拼搏改变命运。",
    "今朝勤学苦，明日跃龙门。",
    "没有等出来的辉煌；只有走出来的美丽。",
    "今天拼搏努力，他日谁与争锋。",
    "当你懈怠的时候，请想一下你父母期待的眼神。",
    "因为有悔，所以披星戴月；因为有梦，所以奋不顾身。",
    "过去的是远了淡了的暮霭，未来的是近了亮了的晨光。",
    "今日有心苦勤奋，明朝一举步青云。",
    "昆仑纵有千丈雪，我亦誓把昆仑截。",
    "眉毛上的汗水和眉毛下的泪水，你必须选择一样！",
    "树凌云壮志，悬梁刺骨，苦尽甘来终有日，蓄建瓴之势，闻鸡起舞，明岁金秋扬眉时。",
    "懒惰厌学难成器，勤奋博学出状元。",
    "一次失误，多出一年辛苦。辛苦一年，迎来精彩一生。",
    "百日竞渡三春香径乘风破浪酬壮志，九年磨砺六月考场摘星折桂展宏图。",
    "感亲恩直拼三年志在金榜题名，报师情再搏百日赢得似锦前程。",
    "千卷诗书满腹才华试问天下谁为王者，万丈豪情青春壮志敢对苍穹我是英雄。",
    "摒弃侥幸之念，必取百炼成钢；厚积分秒之功，始得一鸣惊人。",
    "披星戴月时书香盈耳含英咀华建学业，卧虎藏龙地豪气干云秣马厉兵显锋芒。",
    "勇攀书山逐群雄实现心中梦想，泛游学海定乾坤赢得似锦前程。",
    "信心来自实力，实力来自勤奋。最困难的时候，也是离成功不远的时候。",
    "惜光阴百日犹短，细安排一刻也长。",
    "百日冲刺，苦战三四五，喜看凰墩飞彩凤；一心教学，笑迎六七八，争传瓜井育贤才。",
    "今朝灯火阑珊处，何忧无友；它年折桂古蟾宫，必定有君。",
    "贵有恒何必三更起五更睡；最无益只怕一日曝十日寒。",
    "十年苦读一朝决胜负换来笑逐颜开；数载艰辛六月定乾坤赢得似锦前程。",
    "苦心人，天不负，卧薪尝胆，三千越甲可吞吴；有志者，事竟成，破釜沉舟，百二秦关终属楚",
    "效苏秦之刺股折桂还需苦战，学陶侃之惜时付出必有回报。",
    "乘风踏浪我欲搏击沧海横流，飞鞭催马吾将痛饮黄龙美酒。",
    "辞旧迎新寒风阵阵催人逝，苦尽甘来捷报片片暖人心。",
    "龙腾虎跃朝气蓬勃，你追我赶誓夺第一。",
    "舞风翔鸾旌歌闹处处迎新，披星戴月紫竹宁岁岁登高。",
    "闻鸡起舞成就拼搏劲旅师，天道酬勤再现辉煌王者风。",
    "群雄逐鹿鹿死谁手尚待一朝试锋芒，万木争春春在何处但将今夕放眼量。",
    "自强不息怀壮志以长行，厚德载物携梦想而抚凌。",
    "梅花香自苦寒来，熬头喜在汗水中。",
    "胆性卓然骨硬志坚不留乌江之憾，风华正茂豪气冲天应建定鼎之功。",
    "一路风雨前程磨砺意志，半载苦乐同享铸就辉煌。",
    "宝剑锋从磨砺出，梅花香自苦寒来。",
    "吃得苦中苦，方为人上人。",
    "天下断无易处之境遇；人间哪有空闲的光阴。（曾国藩）",
    "今日寒窗苦读，必定有我；明朝独占熬头，舍我其谁。",
    "十年磨剑三日锋，数载人生在其中",
    "头悬梁，锥刺骨，巾帼挥毫书奇志；三更火，五更鸡，须眉仗笔写华章",
    "只要你想象得到，你就能做到；只要你能梦见，你就能实现。",
    "不能既配不上自己的野心，又辜负了自己曾经受的苦。",
    "望着别人幸福的笑容。心里总觉得不安！",
    "希望是生命的源泉，失去它生命就会枯萎。",
    "生命的价值在于不断地进取，正如滔滔江水奔腾不息。",
    "乐观本身就是一种成功。乌云后面依然是灿烂的晴天。",
    "人生难得几回搏，此时不搏待何时。",
    "人越长大不一定越成熟，但一定会越固执。",
    "成长是场蓄谋已久的阴谋，错了便是错了。",
    "人的心灵是一个客厅，只要你敞开胸怀，你就能容纳更多的人。",
    "用笑脸来迎接悲惨的厄运，用百倍的勇气来应付一切的不幸。",
    "为有牺牲多壮志，敢教日月换新天。",
    "当你休息的时候，一定要想到别人还在奔跑。",
    "知识是一种快乐，而好奇则是知识的萌芽。",
    "如果你因为错过太阳而哭泣，那么你也将错过星星了。",
    "每个人都具有独一无二的价值，没有任何人能够取代我们。",
    "心房的血液慢慢流回心室，如此这般的轮回。",
    "每天努力呼吸着，因为我活着，是为自己。",
    "人因自觉而成长，因自满而堕落，自我反省是人格升华的阶梯。",
    "用积极乐观的心态面对一切，相信你的人生会更美好。",
    "生活还再继续，我微笑着原谅了自己。",
    "永远给自己一个目标，无论大小，让心能展翅飞翔。",
    "人生最大的喜悦，莫过于别人说你做不到，而你却做到了。",
    "失败者总是把挫折当失败，勇气消失殆尽。",
    "成功需要他人帮助，失败绝对是自己造成。",
    "只有在自己站起来之后，这个世界才属于我自己！",
    "一生中错过多少次，就像昨夜下了一场雨，而我却在睡梦中。",
    "信仰是心中的绿洲，思想的骆驼队是永远走不到的。",
    "在社会中获得成功的秘诀是要有一定的热忱和同情。",
    "越努力，越幸运，是最朴素的道理。",
    "总会有一次流泪，让我们瞬间长大。",
    "每天提升正能量，心中充满小太阳。",
    "每个成功的奥特曼，背后总是有一个默默挨打的小怪兽。",
    "我觉得坦途在前，人又何必因了一点小障碍而不走路呢？",
    "失败的时候，不要忘记你还有未来。",
    "梦想是什么，梦想就是一种让你感到坚持就是幸福的东西。",
    "要想成功，必须把过去看做跳板而不是沙发。",
    "时间是小偷，他来是悄无声息，走后损失惨重，机会也是如此。",
    "每一天努力一点点，让自己变得更完美，让那些嘲笑你的人闭嘴。",
    "一切问题，最终都是时间问题。一切烦恼，其实都是自寻烦恼。",
    "如果不是在海市蜃楼中求胜，那就必须脚踏实地去跋涉。",
    "你从未尝试过往上爬，所以凭什么看最美的风景。",
    "只要你长着耳朵，就会听到不中听或中听的话，不必为此烦恼。",
    "机会是靠自己争取的，而不是靠施舍所得的。",
    "一生总该有一次冲动：背起行囊，独自旅行，然后风雨无阻。",
    "好方法事半功倍，好习惯受益终身。",
    "只要还有明天，今天就永远是起跑点。",
    "以自信为圆点，以刻苦为半径，画出自己圆满的人生。",
    "人生最重要的价值是心灵的幸福，而不是任何身外之物。",
    "不经一番寒彻骨，怎得梅花扑鼻香?",
    "没有退路时潜能就发挥出来了。",
    "积极的人在每一次忧患中都看到一个机会，而消极的人则在每个机会都看到某种忧患。",
    "在泪水中浸泡过的微笑最灿烂，从迷惘中走出来的灵魂最清醒。",
    "只要功夫深，铁杵磨成针。",
    "成功就是把复杂的问题简单化，然后狠狠去做。",
    "一切伟大的行动和思想，都有一个微不足道的开始。",
    "我努力，我坚持，我就一定能成功。",
    "获致幸福的不二法门是珍视你所拥有的、遗忘你所没有的。",
    "不管失败多少次，都要面对生活，充满希望。",
    "世界会向那些有目标和远见的人让路。",
    "有志者自有千计万计，无志者只感千难万难。",
    "每一个成功者都有一个开始。勇于开始，才能找到成功的路。",
    "能把在面前行走的机会抓住的人，十有八九都会成功。",
    "很多事先天注定，那是“命”；但你可以决定怎么面对，那是“运”!",
    "没有礁石，就没有美丽的浪花；没有挫折，就没有壮丽的人生。",
    "生命不是要超越别人，而是要超越自己。",
    "吃得苦中苦，方为人上人。",
    "一寸光阴一寸金，寸金难买寸光阴。",
    "环境不会改变，解决之道在于改变自己。",
    "目标的实现建立在我要成功的强烈愿望上。",
    "靠山山会倒，靠水水会流，靠自己永远不倒。",
    "老要靠别人的鼓励才去奋斗的人不算强者；有别人的鼓励还不去奋斗的人简直就是懦夫。",
    "人生难得几回搏，此时不搏何时搏。",
    "当一个人先从自己的内心开始奋斗，他就是个有价值的人。",
    "外在压力增加时，就应增强内在的动力。",
    "用心观察成功者，别老是关注失败者。",
    "有志者自有千计万计，无志者只感千难万难。",
    "为了不让生活留下遗憾和后悔，我们应该尽可能抓住一切改变生活的机会。",
    "无志者常立志，有志者立常志，咬定一个目标的人最容易成功。",
    "意志坚强的人，他的世界充满着无限的可能性。",
    "宝剑锋从磨砺出，梅花香自苦寒来。",
    "因为有悔，所以披星戴月；因为有梦，所以奋不顾身。",
    "不怕你不懂不会，就怕你不学不干。",
    "人生在世，最重要的不是自己处境如何，而是你如何看待自己的处境。",
    "积极思考造成积极人生，消极思考造成消极人生。",
    "永不放弃是你梦想实现的唯一秘诀。",
    "琴弦松驰，弹不出动听的乐曲；生活散漫，点不燃生命的火焰。",
    "再长的路，一步步也能走完，再短的路，不迈开双脚也无法到达。",
    "弱者用泪水安慰自己，强者用汗水磨练自己。",
    "成功的秘诀就是每天都比别人多努力一点。",
    "经过海浪的一番磨砺，卵石才变得更加美丽光滑。",
    "不为模糊不清的未来担忧，只为清清楚楚的现在努力。",
    "绳锯木断，水滴石穿。",
    "永不言败，是成功者的最佳品格。",
    "失败缘于忽视细处，成功始于重视小事。",
    "有望得到的要努力，无望得到的不介意，无论输赢姿态都会好看。",
    "不为失败找借口，只为成功找方法。",
    "人生最大的喜悦是每个人都说你做不到，你却完成它了!",
    "人生就像钟表，可以回到起点，却已不是昨天!",
    "不要问别人为你做了什么，而要问你为别人做了什么。",
    "少壮不努力，老大徒伤悲。",
    "生活确实很艰难，让我们常常无力抵抗，但我们不妨换个心态，换种心情，给自己减负，为生活发一块糖。",
    "碰到一点压力就把自己变成不堪重负的样子，碰到一点不确定性就把前途描摹成黯淡无光的样子，碰到一点不开心就把它搞得似乎是自己这辈子最黑暗的时候，大概都只是为了自己不去走而干脆放弃明天找的最拙劣的借口。",
    "如果你期待自由，那么你要明白女人真正的自由，不在于拥有多少金钱，而在于拥有多少能自由支配的时间，并且同时还能有饭吃有衣穿有房子居住，并且享有创造和尊严。",
    "计较的太多就成了一种羁绊，迷失的太久便成了一种痛苦。过多的在乎会减少人生的乐趣，看淡了一切也就多了生命的释然。",
    "别为了那些不属于你的观众，去演绎不擅长的人生。别人怎么看你，其实和你毫无关系，也不重要。你要怎么活，也和别人毫无关系，任何人也无权干涉。活自己的人生，走自己的路，路在脚下。",
    "人多时，管住嘴。话多、错多、是非多，自找麻烦；人少时，管住心。妄念、妄想、痛苦多，自找烦恼。群处守嘴，独处守心。修己以清心为要，涉世以慎言为先。",
    "善良给对了人，会对你感恩；善良给错了人，会让你寒心。心软给对了人，会对你情深；心软给错了人，会让你痛心。宽容给对了人，会对你热忱；宽容给错了人，会让你窝心。",
    "好的生活方式，是和一群志同道合的人，一起奔跑在理想的路上!回头有一路的故事，低头有坚定的脚步，抬头有清晰的远方。",
    "每一个在你的生命里出现的人，都有原因，喜欢你的人给了你温暖和勇气，你喜欢的人让你学会了爱和自持，你不喜欢的人教会你宽容与尊重，不喜欢你的人让你自省与成长。",
    "人生在世，有许多的不如意，该面对的面对，该化解的化解，不要用一种苛刻的心态对待生活。自己的努力改变着自己的生活，自己的乐观活出一个全新的自我。",
    "凡事不必太在意，一切随缘随心，缘深多聚聚，缘浅随它去。——简单快乐的心态句子",
    "心若计较，处处都有怨言；心若放宽，时时都是春天。世间不如意事十之八九，能对我们百依百顺的人，能让我们如愿以偿的事都很少。我们若非要计较，没有一个人、一件事能让你满意。人活一世，也就求个心的安稳，何必跟自己过不去。心宽一寸，路宽一丈。",
    "人生在世，短暂不过百年。时光静好，心，永远微笑向暖；不假想，不期望，过好每个今天，让日子过得单纯而美好；美好的，留在心底；遗憾的，随风散去。活在当下，且行且珍惜。",
    "天上的星星如此多，为何月亮只有一个。天下女子如此多，为何我们却只爱一个。有一些话，我们很想说出，却始终无法找到最恰当的表达方式。有一些人，我们很想珍惜，却始终找不到最恰当的挽留方式。最后我们只能在时光的错落中，渐渐远离了彼此!",
    "总有一天你会知道：人心换不来人心，认真也得不到情深。做得再好，也会有人视而不见；说得再多，也会有人充耳不闻。你善良，你原谅，你一再忍让，最后伤透了心；你包容，你涵养，你不计前嫌，最终失去信心。这世上，总有不领情的人，也有不感恩的心。",
    "当脾气来的时候，福气就走了!人的优雅在于控制自己的情绪，用嘴伤人是最愚蠢的一种行为。一个能控制住不良情绪的人，比一个能拿下一座城池的人更强大。水深则流缓，语迟则人贵。我们花了两年时间学说话，却要花数十年的时间学会闭嘴……说，是一种能力；不说，是一种智慧。",
    "实实在在的过好每一天，因为未来太过遥远，也未必能等到那天，眼前才是最珍贵的，爱好自己爱的人，想说的就去表达，有什么梦想就去追，也不必浪费时间在乎不喜欢自己的人，跟孩子好好说话别总想有空再说，世界已如此混乱，没有理由不勇敢，勇敢地过好眼前，减少突如其来时的遗憾。",
    "不要轻易走进另一个人的秘密，除非你们有力量分担彼此的命运。生命是一个过程，可悲的是它不能重来，路不通时，学会拐弯；心不快时，学会看开；棘手的事，难做时，学会放下；欲去的缘，渐远时，选择随意。有些情，淡一淡，就释然了。有些累，停一停，就休歇了。有些苦，笑一笑，就冰释了。",
    "以前觉得自己性格能和很多人合的来，什么样的朋友都能结交；后来明白结交朋友或许不难，难的是如何变成知己。人与人之间似乎真的有磁场这回事，一接触就能感觉出来。有些人能和你一见如故，有些人和你永远亦不会深交。不是不好，只是磁场不合。所以能遇到“对味”的人，真的挺幸运的，感谢相遇吧。",
    "好多时候，是自己把自己折腾累了，自己把自己纠缠烦了，然后，这个自己挣脱不开另一个自己。坑其实是自己挖的。光阴的泥淖里，多少人，都自己逗着自己玩。人的选择性就是这么顽固，顽固得近乎荒、唐。你本可以云淡风轻地活，然而，却无缘无故地受了伤。是的，有些伤害是来找你的，而有些伤害是你找来的。",
    "人生就像一场戏，每天上演着不同的各种角色，这场戏没导演、没有编导、没有预告，有的人找对了角色，幸福一生，有的人演错了角色，痛苦一生，有的人累了，懂了自己要什么，懂得找个地方停靠，有的人累了，还拼命去演这个角色，有的角色，不是所有人都适合去演的，我们主导不了别人，但可以主导得了自己。",
    "人，累了，就休息；心累了，就淡定。长大了，成熟了，这个社会就看透了。累了，难过了，就蹲下来，给自己一个拥抱。因为这个世界上没有人能同情你，怜悯你。你哭了，眼泪是你自己的；你痛了，没有人能体会到。那么你只有流着泪去微笑。",
    "当生活变成了复印机，今天和昨天，明天和今天都一模一样，那你该是时候停下来想想了……",
    "安守一颗平常心，人生才能笑看风云。每个人都有自己的事要做，一个真正聪明的人，小事糊涂而大事睿智，为人低调而洞若观火。做人如水，以柔克刚。只有那些以不争为争的人，才能笑到最后，成为真正的赢家。",
    "生活赋予我们每个人的权力都是公平的，不要每天去抱怨为什么自己的生活不如别人，其实从另一个角度去看，是自己没有努力的去生活，发现生活的美好之处，当你久病住院，从离开医院的那天起，你是否会发现生命是如此美好呢?活着是多么幸福的一件事呢?一切都是那么美好。",
    "你所做的事情，也许暂时看不到成功，但不要灰心，你不是没有成长，而是在扎根。放下焦虑，放下懒惰，继续加油!愿所有梦想都不被辜负!——简单快乐的心态句子",
    "每个人都有自己的幸福，仰望别人的幸福时，别人也在仰望你的幸福。难得糊涂，容易幸福；过于较真，容易烦恼。能终日快乐，就实现了生命最大的价值。",
    "人生是一趟单程车，一路向前，永不回头。我们每天迎来崭新的岁月，却常常在自己的蹉跎中，反复过着同样的日子。不要怨天尤人，改变才是出路。所有人共享着同一段岁月，却在不同的选择中分道扬镳。静下心来，找回自己。脚步向前，境界向上，人生才有希望。",
    "风还是一样的吹，花还是一样地开，所谓的命运不过是一个人的情感，性格。始终相信这些因素都是人为可以改变的。不管怎么说，命运是在自己手里的。",
    "人生百味，情最浓，人生繁华，淡最真，人生一路，一步有一步的风景，一程有一程的感悟，不论时光如何流转，有些东西不会改变，那就是对美好的追求，对真情的渴望，给自己一份淡然。",
    "比我差的人还没放弃，比我好的人仍在努力，我就更没资格说我无能为力!你配不上自己的野心，也辜负了曾经历的苦难。",
    "一生中，总有那么一段时间，需要你自己走，自己扛。不要感觉害怕，不要感觉孤单，这只不过是成长的代价。",
    "谁不虚伪，谁不善变，谁都不是谁的谁。又何必把一些人，一些事看的那么重要。",
    "不爱理你的人就别去打扰了，赔了笑脸还丢了尊严。",
    "每天给自己一个希望，试着不为明天而烦恼，不为昨天而叹息，只为今天更美好!",
    "不要轻易把伤口揭开给别人看，因为别人看的是热闹，而痛的却是自己。",
    "真正关心你的人，是无事时百般挑剔，有事时抓着你手一声不吭的。监督你过顺境，支撑你过逆境，人生三两人，足矣。",
    "宁愿与狼为伍，也不与狗同行，我不坏，也不是什么好人。",
    "若无其事，原来是最好的报复。何必向不值得的人证明什么，生活得更好，是为了自己。",
    "该来的都会来，该走的全会走，别抗拒，别挽留，别贪恋，别不舍，别担心。学着看淡一些事情，才是对自己最好的保护。",
    "人性有一个弱点，你越在意什么，什么就越折磨你。当你不再畏手畏脚，当你鼓起勇气，下定决心忠于自己，每一天都将是最好的状态。",
    "你害怕发生的事情，其实根本不用担心，因为它一定会如期而至，也一定会如期离去。",
    "不经历凛冽的寒风，不会有梅花的怒放；不经历素裹的寒霜，不会有翠竹的坚韧，不经历厚重的白雪，不会有青松的挺直；不经历寒冷的冬天，不会有明媚的春天!",
    "有些事藏在心里是莫大的委屈，话到嘴边又觉得无足挂齿不值一提。",
    "不要在人前哭，也不要在深夜做任何决定。",
    "比我好的还在努力，比我差的还没放弃；我有什么资格说我无能为力。",
    "拥有一个让你耗尽此生也不觉得疲惫的梦想，是生活赐予你最好的礼物。人生是一种承受，我们要学会支撑自己。当你觉得孤独无助时，想一想还有几十万亿的细胞只为了你一个人而活。",
    "得不到的事物别惦记，负能量的事物要远离，人生本就不差风雨，就别再为己徒增伤悲。",
    "愿你能做自己的太阳，与山川湖海为伴，自信勇敢，保持善良。",
    "这个年纪真的很尴尬，不够成熟也不够幼稚，没有能力却有野心。",
    "生活是自己的，你选择怎样的生活，就会成就怎样的你。与其抱怨这个世界不美好，不如用自己的努力，争取更多的美好和幸运。",
    "我并不快乐，但我可以笑着生活。",
    "你可以有一段糟糕的爱情，但不能放纵自己过一个烂透的人生。",
    "之所以活的累，是因为放不下架子，撕不开面子，解不开情结。",
    "不要贪恋没意义的人或事，拎着垃圾的手怎么腾得出来接礼物。",
    "最艰难的日子终将过去，此后你将一身荣光屹立于世。",
    "这个世界，不会因为你的懦弱无能，而停下脚步，你若不勇敢，没人替你坚强。",
    "为得钢骨洒热血，我命由我不由天。",
    "在我的天空，做我的英雄。",
    "别人都在努力，你有什么资格懒惰，当你在赞叹别人的成功为何不看看别人的付出，与其赞叹不如超越。",
    "天赐我一双翅膀，就应该展翅翱翔，满天乌云又能怎样，穿越过后就是阳光。",
    "我本可以坠入深渊，我偏要一鸣惊人。",
    "人生的道路上，有些事只能自己面对，我很想依赖，但我必须坚强。",
    "认真的人改变自己，坚持的人改变命运。",
    "你花时间做什么事，你就会成为什么样的人!",
    "那些打不垮你的东西，最终必将成就你。",
    "喜欢就坚持，爱就别放弃!",
    "努力不一定成功，但不努力一定不成功。",
    "别人的质疑就是我进步的动力，总有一天我可以证明自己。",
    "欲带皇冠，必承其重。欲握玫瑰，必承其痛。",
    "反正我来到这个世界上就没打算活着回去。",
    "你生而有翼，为何一生匍匐前进，形如蝼蚁。",
    "现在不努力拼搏进取，将来你该拿什么跟别人比。",
    "连自己的心都不相信的人，才是最可怜的弱者。",
    "你所有的借口不过你给拖延和懒惰找的理由，哪有那么多未来等着你，你只有现在。"
  ];

  static List listData = [
    {
      'id': "1",
      'day': '07-08',
      'status': _TimelineStatus.todo,
      'time': '13:20',
      'remark': "备注：降价1000客户可考虑，辛苦再撮合备注：降价1000客户可考虑，辛苦再撮合备注：降价1000客户可考虑",
      'description': '',
      'subtitle': '何神(主播)',
      'title': "新建工单"
    },
    {
      'id': "2",
      'day': '07-08',
      'status': _TimelineStatus.sync,
      'time': '13:20',
      'description': "备注：降价1000客户可考虑，辛苦再撮合备注：降价1000客户可考虑",
      'subtitle': '吴飞飞(销售专员)',
      'title': "联系客户"
    },
    {
      'id': "3",
      'day': '07-08',
      'status': _TimelineStatus.inProgress,
      'time': '13:20',
      'description':
          "备注：降价1000客户可考虑，辛苦再撮合备注：降价1000客户可考虑，辛苦再撮合备注：降价1000客户可考虑，辛苦再撮合",
      // 'subtitle': '何神(主播)',
      'title': "新建工单"
    },
    {
      'id': "4",
      'day': '07-08',
      'status': _TimelineStatus.done,
      'time': '13:20',
      'description':
          "备注：降价1000客户可考虑，辛苦再撮合备注：降价1000客户可考虑，辛苦再撮合备注：降价1000客户可考虑，辛苦再撮合",
      'subtitle': '何神(主播)',
      'title': "新建工单"
    },
    {
      'id': "5",
      'day': '07-08',
      'status': _TimelineStatus.done,
      'time': '13:20',
      'description': "备注：降价1000客户可考虑",
      'subtitle': '何神(主播)',
      'title': "新建工单"
    }
  ];
}

enum _TimelineStatus {
  done,
  sync,
  inProgress,
  todo,
}
