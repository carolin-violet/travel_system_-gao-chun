/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : travel

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 10/06/2022 20:19:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论序号',
  `mark_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '旅馆、景点、美食等id',
  `tourist_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '游客id',
  `comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论',
  `sentiment` tinyint(0) NULL DEFAULT NULL COMMENT '情感倾向(2为积极的，0为消极的)',
  `is_deleted` tinyint(0) NOT NULL COMMENT '逻辑删除',
  `create_time` datetime(0) NOT NULL COMMENT '评论时间',
  `modify_time` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1534863303535333378', '1533714280887640065', '1534064312866316290', '好好玩呀', 2, 1, '2022-06-09 19:41:43', '2022-06-10 20:03:17');
INSERT INTO `comment` VALUES ('1534863432665370625', '1533714280887640065', '1534064312866316290', '真刺激', 2, 0, '2022-06-09 19:42:13', '2022-06-10 20:03:17');
INSERT INTO `comment` VALUES ('1534863467507453954', '1533714280887640065', '1534064312866316290', '慵懒的一天开始啦', 2, 0, '2022-06-09 19:42:22', '2022-06-10 20:14:34');
INSERT INTO `comment` VALUES ('1534863486549594114', '1533714280887640065', '1534064312866316290', '太糟心了', 0, 0, '2022-06-09 19:42:26', '2022-06-10 20:14:35');
INSERT INTO `comment` VALUES ('1534863506275405825', '1533714280887640065', '1534064312866316290', '有点忧郁', 0, 0, '2022-06-09 19:42:31', '2022-06-10 20:15:23');
INSERT INTO `comment` VALUES ('1534863521630752770', '1533714280887640065', '1534064312866316290', '不错不错', 2, 0, '2022-06-09 19:42:35', '2022-06-10 20:15:23');
INSERT INTO `comment` VALUES ('1535067960027189250', '1533714280887640065', '1534064312866316290', '芜湖起飞', 2, 0, '2022-06-10 09:14:57', '2022-06-10 20:15:52');

-- ----------------------------
-- Table structure for delicacy
-- ----------------------------
DROP TABLE IF EXISTS `delicacy`;
CREATE TABLE `delicacy`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '美食id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '美食名称',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '美食描述',
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '美食图片',
  `popular` tinyint(0) NOT NULL COMMENT '展示优先级',
  `is_deleted` tinyint(0) NOT NULL COMMENT '逻辑删除',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modify_time` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of delicacy
-- ----------------------------
INSERT INTO `delicacy` VALUES ('1533775128150695938', '固城湖螃蟹', '蟹是美味，人人喜爱，无间南北，不分雅俗。来到高淳，怎能不品蟹？作为高淳最出名的美食，固城湖大闸蟹声名远扬。每到秋季，便有大批游人慕名而来。一盘热气腾腾的大闸蟹端上来，蟹的外壳已经蒸的金黄，那是一种绚烂的颜色。透过热气便是大闸蟹诱人的香气，让人急不可耐的想要拿起它。拨开外壳，黄灿灿的蟹黄让人垂涎欲滴，远远望去，就如同一块块金子。用勺子舀一点醋放在蟹盖里，酸溜溜的醋配上蟹黄十分美味。厚厚的一团蟹黄放在嘴里，满足感油然而起。吃完蟹黄，慢慢地拨开蟹肚上的绒毛，敲碎外壳，里面的肉细嫩而整齐，咬上去滑滑嫩嫩，让人欲罢不能。将蟹腿剪成三截，最末一截蟹脚尖可充当工具。再用蟹脚尖细的那一头把蟹腿中段的肉捅出来，然后用蟹脚尖粗的那一头把蟹腿前段的肉捅出来，便可完整地吃完一只蟹。固城湖螃蟹需要慢慢地品尝，犹如高淳的慢生活，需要慢下来，才能享受。品蟹是一门慢艺术，君子吃料尝之味，食之有度，才能慢慢体会大闸蟹丰腴圆润的口感，啖啖浓郁之香。', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/197013747e374607969e12504d70690e48901d10-bcad-484e-bb1a-fc5b67f2b791.webp', 5, 0, '2022-06-06 19:37:41', '2022-06-06 19:37:41');
INSERT INTO `delicacy` VALUES ('1533775398192570369', '蟹黄汤包', '漫步高淳老街，你肯定会被一簇簇的热气和长长的排队等待的人群勾起好奇心，是什么吸引了这么多人？那就是高淳著名的小吃蟹黄汤包。忍不住叫上两屉，只见一只汤包卧在小小的碟子里，汤包十分的饱满、圆滑，顶端的熠皱层层叠叠，细黄的姜丝躺在底下，黑色的醋均匀地洒在汤包的四周。白、黄、黑三种色调，明快亮丽地构成了一幅抽象画，蟹黄汤包香气四溢，带着螃蟹的鲜香，合着醋的浓香，混着姜丝的清香，让人情不自禁的深吸一口气，真是沁人心脾。**轻轻地在汤包上面咬上一个小口，冷却一会儿，再慢慢地吸着里面的蟹汤，闭上眼睛，细细品尝，缓缓回味，就会感到鲜香无比。喝完汤后，便可以看见一小块一小块金黄色、橘红色的蟹黄和白色的细嫩蟹肉。和着汤包皮一起咀嚼着，面皮的清香，螃蟹的浓香，真是相得益彰！在慢慢的美食享受中，仿佛融入了老街上空那一团团热气，融入了高淳的情怀中……', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/50abce1d8e4b4564921883fbdbdda14f120eb84713d0c0a88cd8e398c416126f.webp', 5, 0, '2022-06-06 19:38:46', '2022-06-06 19:38:46');
INSERT INTO `delicacy` VALUES ('1533775663847202817', '豆腐丸子', '丸子，在全国各地的餐桌上盛行，彰显着它的无穷魅力和美味，在高淳，有一种丸子也甚是流行，但你一定想不到，它是豆腐做的。说到豆腐，人们想必会想到它的脆弱，一碰就碎的嫩豆腐，怎么会做成丸子呢？高淳的豆腐肉丸正妙在此处。“我们的用料极为讲究，一定要选用新鲜的猪腿肉，手工将其剁成肉泥，这样可以将猪肉的的粘性发挥至最大，然后将一整块豆腐放入，为了抵消豆腐的豆腥味，还需要把豆腐提前吊水以便排除豆腐中的水分，将豆腐捏碎，配上鸡蛋、料酒、盐、白胡椒粉等佐料，顺时针方向搅拌十五分钟，取一团馅料，用双手不停的翻转，捏成丸子形状，便可下水。”慢工出细活，菜虽简单，其味无穷。在一整套的手工料理下，豆腐和肉融为了一体。嚼上一口，鲜嫩爽口。你分不清那究竟是充满弹性有嚼劲的鲜肉，还是柔嫩细滑的豆腐。豆腐有了肉的灵性，变得爽口。肉里也吸收了豆制品的清香，变得清新，成为让人无法拒绝的诱惑。', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/e53ba74aeb6d45a4a99df2172b683001231439207859.webp', 3, 0, '2022-06-06 19:39:49', '2022-06-06 19:39:49');
INSERT INTO `delicacy` VALUES ('1533775926498713602', '固城湖水八仙', '水八仙是高淳地区的传统食物，又称水八鲜，包括茭白、莲藕、水芹、芡实(鸡头米)、茨菰（慈菇）、荸荠、莼菜、菱八种水生植物的可食部分。水八仙大多在秋天上市。每到秋天，游客们就可以在高淳品尝到鲜美的水八仙烹制的各色美食，爱吃水八仙的游客们可千万不要错过！', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/f957c9ddcd014c3190092553a508233d232148495139.webp', 4, 0, '2022-06-06 19:40:52', '2022-06-06 19:40:52');
INSERT INTO `delicacy` VALUES ('1533776168732352513', '千里香', '“千里香”，一个高雅而别致的名字，外地人怎么也不会想到，它竟然是高淳一道“名菜”的美称。这道菜，高淳人俗称“烂（臭）腌菜水”。这烂腌菜水炒豇豆，炖豆腐，闻起来臭，吃起来香，颇有点臭豆腐干的风范，但臭豆腐干却取代不了这“千里香”。“千里香”从诞生那天起，就颇受争议。有人喜欢，有人厌恶。喜欢吃的人，无它不下饭，吃了“三月不知肉香”。厌恶它的人，闻到那臭味，三天不进厨房。但是，喜欢也好，厌恶也罢，“千里香”就这么一直在人们的褒贬声中，几十年、上百年地在普通人家的饭桌上摆放着、延续着，让不少人大口大口地吞食着。说它是餐饮文化的积淀，有点言过其实。虽然不能登大雅之堂，但许多人对它却情有独钟。“千里香”制作过程其实很简单，就是把吃不完的缸腌菜继续沤制、密封、发酵，到来年初夏即可打开食用，其生产流程比起制作泡菜、酸菜容易多了。这种吃到嘴里爽，吃下去令人难忘的，香臭混杂的复合型食品，的确是高淳的特产。\n', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/e2be56e44eeb4b518a87baadfb656286045b29a8-bda7-42d5-8d80-ce2a740ea1c9.webp', 3, 0, '2022-06-06 19:41:49', '2022-06-06 19:41:49');
INSERT INTO `delicacy` VALUES ('1533776335044894721', '青团', '每年清明前后，是采摘破絮果草的最佳时节，高淳人采来之后将其捣碎和面，搭配细腻绵柔的豆沙或浓郁的芝麻，制成软糯的青团子，便能让春天的气息在舌尖回绕。', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/b06d7b4787574698bb78c16af6510b31181508135539.webp', 3, 0, '2022-06-06 19:42:29', '2022-06-06 19:42:29');

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '反馈id',
  `tourist_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '游客id',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '反馈内容',
  `is_deleted` tinyint(0) NOT NULL COMMENT '逻辑删除',
  `create_time` datetime(0) NOT NULL COMMENT '添加时间',
  `modify_time` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of feedback
-- ----------------------------
INSERT INTO `feedback` VALUES ('1535229602958409729', '1534064312866316290', '这个地方要改进下', 0, '2022-06-10 19:57:15', '2022-06-10 19:57:15');
INSERT INTO `feedback` VALUES ('1535230379265359873', '1534064312866316290', '那个物品需要维修了', 0, '2022-06-10 20:00:20', '2022-06-10 20:00:20');

-- ----------------------------
-- Table structure for hotel
-- ----------------------------
DROP TABLE IF EXISTS `hotel`;
CREATE TABLE `hotel`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '旅馆id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '旅馆名称',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '旅馆介绍',
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '旅馆图片',
  `popular` tinyint(0) NOT NULL COMMENT '展示优先级(用户主网站展示)',
  `is_deleted` tinyint(0) NOT NULL COMMENT '逻辑删除',
  `create_time` datetime(0) NOT NULL COMMENT '添加时间',
  `modify_time` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hotel
-- ----------------------------
INSERT INTO `hotel` VALUES ('1533714280887640065', '半城·大山房车度假酒店', '要问什么适合年终团聚的民宿\n\n一定是这家——房车营地！\n\n主打的房车特色十足\n\n你可以和亲朋好友包下一个“房车院落”\n\n吃喝玩乐互相分享，睡觉休息互不打扰\n\n视季节情况还有篝火晚会和烟花表演~', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/327690f6dfce4fcc8d4130762392596d181001434895.webp', 3, 0, '2022-06-06 15:35:54', '2022-06-06 15:35:54');
INSERT INTO `hotel` VALUES ('1533763612873613313', '得半庄园', '得半庄园位于国家4A级景区南京游子山休闲旅游区，背倚桠溪国际慢城，是高淳第一座集“度假、养生、文化、投资”为核心功能经营的地标性庄园。得半庄园周围青山环绕，水网密布，地理位置得天独厚，园内茂林修竹，松风水月，暗香疏影令人心醉神陶。鸢飞戾天者望峰息心，经纶世务者窥谷忘反。庄园内有纯天然绿色的生态菜地，您可以亲手采摘一年四季的新鲜时蔬，感受生活的真态与自然的美好。在这里，得半邀您共同体验田园牧歌式的乡村惬意生活。木屋的选址也是别具匠心，位于小茅山麓，周围修竹密林鸟语花香。住在大自然中，体验生态与美。', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/7b71405637194a869b518002c62678d0180957532387.webp', 4, 0, '2022-06-06 18:51:56', '2022-06-06 18:51:56');
INSERT INTO `hotel` VALUES ('1533765264175292417', '蘭园民宿', '蘭园的前身，是一户留存了百年的清代家宅，这座隐而不秘的古宅能让你在这条人声鼎沸的老街里，感受到时间的静与安。随处可见的精致木雕和灰青色瓦片，窗外的小巷子里偶尔有叫卖的小贩路过，复古的铜灯，精致装裱的字画，让人觉得格外质朴安逸。如若遇上下雨天，在此处喝着茶，听着雨声淅淅沥沥的声音，品味江南的细雨，又是一番安逸景象。若想体会烟火气息，出了门穿过青石板铺就的小巷，便可在这条历经沧桑的徽派建筑老街中感受它的特色。白天与亲人、爱人一起享受美食、感受时光，晚上入睡之前可以尽情的在民宿天井下面看星星与月亮，早上醒来则是闻着花香、听着鸟鸣，相信在这里度过的一夜，必定是美好。', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/3606895e1596402db025c3e193a5f477640 (12).webp', 5, 0, '2022-06-06 18:58:30', '2022-06-06 18:58:30');
INSERT INTO `hotel` VALUES ('1533765653155045378', '开元度假酒店', '南京固城湾开元度假酒店，就坐落在南京高淳的固城湾景区里，旁边就是高淳老街，与固城湖也仅仅一堤之隔。这里闹中取静，枕水而居，推开门就是水光潋滟，脚踩青石板漫步，游老街·吃螃蟹·赏风景，好不惬意！固城湾景区里可玩的地方也超级多，你可以去白鹿森林萌宠乐园邂逅超多可爱的小动物，或者是去瑞兽馆祈福、亦或是去手账店、首饰店、玩偶店逛一逛，满足自己的无敌少女心，还可以乘船游园，与黑天鹅共赏固城湾的美景！如果想要亲子体验，这里还有大量亲子玩乐体验项目，可以去景区内的扎染坊，体验方巾扎染；还可以去彩虹坊儿童手作馆，体验手工项目。简直就是孩子们疯玩的天堂，玩上一整天！', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/b80c62b122804d3197d09313e6db58d5640 (1).webp', 4, 0, '2022-06-06 19:00:02', '2022-06-06 19:00:02');
INSERT INTO `hotel` VALUES ('1533766068005265410', '陇上', '篱笆墙筑起的小院，枫叶映衬着铜红色的大门，隐匿在林间的这栋小屋便是“家和隐舍”。院子里的四方天空，屋后的竹林水塘，追鸡赶鸭的孩子，构成了童年记忆的缩影。屋内明亮的灯光，时尚宽敞的客厅和开放式的厨房，还有漫威授权的1:1定制钢铁侠。玩累了便在沙发上慵懒地瘫一会，或是在浴缸里泡个澡，褪去满身的疲惫。漫居内部整体装修走的简约舒适风格，面朝竹林，早起被照进窗台的阳光和鸡鸣声叫醒，夜晚静卧在阳台看着婆娑的竹影，动静间，方能静心窥出生活的本质。沿着石板小路往下走，抬头瞧见一栋造型别致的建筑，便是凡涧。门口有两个梧桐树将凡涧包围在其中，住在屋内，颇有种置身于古村秘境的感觉，登上二楼的露台，在枝叶的阴影下小憩，四季之景，皆收眼底~', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/9a1d540b714c42fa9038b6b9577322ef640.webp', 4, 0, '2022-06-06 19:01:41', '2022-06-06 19:01:41');
INSERT INTO `hotel` VALUES ('1533766340786020354', '时光碎片文艺酒店', '南京时光碎片文艺酒店，位于中国第一慢城---高淳桠溪国际慢城的慢城南路上，与国际慢城景区游客中心一路之隔，南面是游子山国家森林公园。**酒店系中国民间文化传承示范基地，南京文艺家创作基地，占地482亩。开车导航搜索“时光碎片文艺酒店”即可。酒店在素有“中国最美茶园”内，依山傍水，风格独特，文化气息浓郁，属于文化艺术型特色酒店。**酒店设有客房、餐饮、会议、垂钓、烧烤、骑马、采摘、露营等项目。餐厅可同时容纳200人就餐，适合企业商务接待、会议培训、新品发布、家庭聚会、室内外婚宴、亲子拓展等活动。**酒店另有云锦、剪纸等6栋非遗传承人工作室、非遗传习所、非遗文化展陈馆、三亩农耕天下亲子体验等可供游客参观体验。', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/9cef4c05dea94a499b0cb640440471c2181029587953.webp', 3, 0, '2022-06-06 19:02:46', '2022-06-06 19:02:46');
INSERT INTO `hotel` VALUES ('1533767541460066306', '瑶池山庄酒店', '瑶池山庄酒店位于山清水秀、景色怡人的高淳桠溪——中国第一国际慢城。素有“慢城首站，七彩瑶池”之誉。春有金花遍野，夏有荷香扑鼻，秋有落英缤纷，冬有白雪无垠。全新构建的瑶池山庄酒店以餐饮、会议、住宿、娱乐为主。风格迥异的餐饮包间，最大能容纳30人同时就餐，原汁原味的精美菜肴让你乐享舌尖美味；舒适明快的景观客房，依山傍水，可将满城美景尽收眼底；各种类型的会议厅拥有时下最先进的科技设备，能满足各类会议、培训需求，最大可容纳400人的中央会议厅更是举办大型宴会之首选；垂钓、棋牌、KTV、户外烧烤、拓展培训等各种休闲娱乐设施，为您增添无限乐趣！瑶池山庄酒店“淳味”菜肴，让您一年四季乐享舌尖美味！春天品尝新鲜野菜、夏天品尝高淳水八鲜、秋天品尝固城湖大闸蟹、冬天喝一口慢火煨炖的老鸡汤，丰富多样的菜肴品类，让食客赞不绝口！', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/363c49be031a4aff8ebacba18ba23e5d181022445240.webp', 3, 0, '2022-06-06 19:07:33', '2022-06-06 19:07:33');
INSERT INTO `hotel` VALUES ('1533767904238002177', '枕松度假酒店', '“闲期竹色摇霜看，醉惜松声枕月眠”\n\n枕松酒店四面皆是松林\n\n犹如散落在绿野中的一颗明珠\n\n尤其适合亲子家庭出行\n\n酒店有绵羊喂养、摸鸭蛋等活动\n\n来这，就是和大自然来一次亲密接触！', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/4fa002f394274368a96d338f01a1ec20640 (3).webp', 4, 0, '2022-06-06 19:08:59', '2022-06-06 19:08:59');
INSERT INTO `hotel` VALUES ('1533768369625391106', '正福草堂', '午后，阳光多了一丝热意。道道光线编织成巨大的薄纱，轻轻地包裹着大地上的万物。在这层柔和的光线中，一切都变得慵懒。每每到了这个时刻，驱车来到游子山，寻一间酒店做一个悠然见南山的梦，就是此刻最闲适的生活。千百年来，高淳人“见不到游子山就会哭”，这种游子文化的情结深深植根于高淳人的血液里，游子山更是高淳人心目中的圣山。**小茅山者，茅山之有余也，位乎南京高淳也，正福草堂里网罗古今器具，含化宋明园林，茶香为友，琴书是朋，乃中式生活美学，慕西园雅集之风流，述怡园琴会之故事，可闲论古趣，散作生活。 竹风徐来，茶温香爇，将待四海之友朋，松石清华，曲曼琴婉，慨会九州之知音。', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/f8e4664edcc1461eb2561093d8943889640.webp', 4, 0, '2022-06-06 19:10:50', '2022-06-06 19:10:50');

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员姓名',
  `telephone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员手机号',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员密码',
  `is_deleted` tinyint(0) NOT NULL COMMENT '逻辑删除(1为删除，0为没删除)',
  `create_time` datetime(0) NOT NULL COMMENT '记录添加时间',
  `modify_time` datetime(0) NOT NULL COMMENT '记录修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('0', 'admin', '17075256495', '$2a$10$1U.9C0YPSBCaZFwVhiKV.eJiufB1pVbVbbPdG/GgJFk46enqdAXG2', 0, '2022-05-24 09:07:27', '2022-05-24 09:07:32');
INSERT INTO `manager` VALUES ('1531473122052620289', '王东', '12345678910', '$2a$10$Qml2UWOcgs.6Vm002CK/CumZH3BakApOHs0Eu0g9/jBB1zzX2aMr6', 0, '2022-05-31 11:10:20', '2022-05-31 11:10:20');
INSERT INTO `manager` VALUES ('1533712536019427330', '张三', '12345678913', '$2a$10$j.VeJGF5GKnVci7JPWZKw.tugx//4nmQ1LjkeoWHzjBKQi33XS9Ia', 0, '2022-06-06 15:28:58', '2022-06-06 15:28:58');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告名称',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告描述',
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告图片',
  `is_deleted` tinyint(0) NOT NULL COMMENT '逻辑删除',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modify_time` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('1534412199945048065', '又是一年重阳时，高淳慢城两大景点免费福利大放送！', '碧云天黄叶地，又到重阳时节。恰逢国庆长假尾声，让我们为父母策划一场说走就走的旅行，来慢城感受金风送爽，丹桂飘香。小慢要告诉大家的是，固城湖水慢城和桠溪国际慢城，可都有免费活动奉上呦~快跟我看看去！NO.1  10月7日60周岁以上老人凭本人身份证可免费入园！NO.2  10月7日70周岁以上老人可携1名子女陪同免费游园！NO.3  水慢城特别推出【重阳养生套餐】，再加1元可获1只固城湖大闸蟹！', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/6f4a40c26993447a819d3177a0ab5ec2640.webp', 0, '2022-06-08 13:49:11', '2022-06-08 13:49:11');
INSERT INTO `notice` VALUES ('1534412756822790145', '秋意正浓，不负慢城赏花好时光！更有玻璃栈道、萌娃晒照等你来参与~', '秋意正浓，不染离愁。慢城终于迎来了一年里最美的季节，秋雨凉心时，素雅、静美；阳光明媚时，娇艳、繁盛。是时候去慢城走一走了，在萧瑟冬日来临前，收藏五彩斑斓的秋日盛景，不负这慢城赏花好时光！仓央嘉措曾写过一首关于格桑花的诗，“格桑花开了，开在对岸，看上去很美。看得见却够不着，够不着也一样的美。”\n\n格桑花又称格桑梅朵，花语是“怜取眼前人”。在藏语中，“格桑”是“美好时光”或“幸福”的意思，“梅朵”是花的意思，所以格桑花也叫幸福花。\n\n这不，仓央嘉措的格桑花看得见够不着，桠溪慢城吕家大草坪的格桑花，却是五彩斑斓，近在眼前。', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/9e2dffd48a5749a5835daa0bef81b321640 (1).webp', 0, '2022-06-08 13:51:24', '2022-06-08 13:51:24');
INSERT INTO `notice` VALUES ('1534413075606671362', '瑜伽露营节|夜阑观星，草地为席，一起去水慢城感受自然！', '今年，水慢城继续以“瑜伽”为约！“高淳国际慢城瑜伽露营节”，本周末在水慢城盛大启幕！\n\n一场千人相聚回归自然的体验，草地上露营、星空下冥想、晨曦中练习瑜伽……与花海、湖水、绿氧相遇，留下最美伽人丽影！', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/2bf60ec3594e46d4b46ebd907b81e2f1640.webp', 0, '2022-06-08 13:52:40', '2022-06-08 13:52:40');
INSERT INTO `notice` VALUES ('1534414666803978241', '高马报名满额，下周日不见不散', '2019高淳国际慢城马拉松赛将于11月3日在我区举行。为确保比赛安全顺利进行，届时将对双高路、双湖路、永城路、古檀大道、宝塔路（宝丹路口至财产保险公司路口）、固城湖南路、淳兴路（牛头山至官溪路路口）、湖滨大道、永成路、迎湖路、水慢城内部道路、双湖南路实行交通管控，并在相邻外围道路同步采取分流措施。', NULL, 0, '2022-06-08 13:58:59', '2022-06-08 13:58:59');
INSERT INTO `notice` VALUES ('1534414848325066753', '高淳蟹王蟹后争霸赛诞生“双料冠军”，重量竟达......', '今天下午，第十九届固城湖螃蟹节蟹王、蟹后争霸赛在高淳区水产技术推广站拉开帷幕，高淳区砖墙、阳江、淳溪、古柏、固城五个街镇均选送了最为“膘肥体壮的选手”参加比赛。公蟹螯大体壮，母蟹腹饱丰满，“参赛者”们亮相后，观众席发出阵阵惊叹声，“真大！”最终，古柏街道选送的螃蟹以555克和455克的重量，一举夺下蟹王、蟹后两项殊荣，成为本次比赛的“双料冠军”！', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/55dba501d6fe40a98a21401120c489a2640 (1).webp', 0, '2022-06-08 13:59:43', '2022-06-08 13:59:43');
INSERT INTO `notice` VALUES ('1534414948770258946', '展会速递|2019南京融交会高淳老街·国际慢城展区精彩等您来看！', '今天，10月25日，\n\n2019南京融交会开幕啦！\n\n这次展会紧扣“新时代 新体系 新体验”的展览主题\n\n硬核科技 / 光影世界\n\n文化之旅 / 头脑风暴 \n\n…… \n\n16个国家文化和科技融合示范基地\n\n近百场活动 400+企业\n\n带你感受一波“文化&科技”的冲击！', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/bd2c46770e7a473abd6293e0999aa3b4640.webp', 0, '2022-06-08 14:00:07', '2022-06-08 14:00:07');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, '0', 1);
INSERT INTO `permission` VALUES (4, '0', 2);
INSERT INTO `permission` VALUES (5, '0', 3);
INSERT INTO `permission` VALUES (6, '0', 4);
INSERT INTO `permission` VALUES (7, '0', 5);
INSERT INTO `permission` VALUES (8, '0', 6);
INSERT INTO `permission` VALUES (9, '0', 7);
INSERT INTO `permission` VALUES (10, '0', 8);
INSERT INTO `permission` VALUES (18, '0', 9);
INSERT INTO `permission` VALUES (19, '0', 10);
INSERT INTO `permission` VALUES (20, '1531473122052620289', 2);
INSERT INTO `permission` VALUES (21, '1531473122052620289', 7);
INSERT INTO `permission` VALUES (22, '1531473122052620289', 9);
INSERT INTO `permission` VALUES (23, '1533712536019427330', 8);
INSERT INTO `permission` VALUES (24, '1533712536019427330', 9);
INSERT INTO `permission` VALUES (25, '1533712536019427330', 10);
INSERT INTO `permission` VALUES (26, '1533712536019427330', 5);

-- ----------------------------
-- Table structure for photos
-- ----------------------------
DROP TABLE IF EXISTS `photos`;
CREATE TABLE `photos`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片id',
  `mark_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片所属类型id，比如(旅馆、景点、美食、游记等等)',
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片链接',
  `is_deleted` tinyint(0) NOT NULL COMMENT '逻辑删除',
  `create_time` datetime(0) NOT NULL COMMENT '添加时间',
  `modify_time` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of photos
-- ----------------------------
INSERT INTO `photos` VALUES ('1533714369114824706', '1533714280887640065', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/dde109b0509d42069c3c084afefb5078640 (1).webp', 0, '2022-06-06 15:36:15', '2022-06-06 15:36:15');
INSERT INTO `photos` VALUES ('1533714385342586881', '1533714280887640065', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/f5fa8f53ba9245d595ffd7219c61b6dc640 (2).webp', 0, '2022-06-06 15:36:19', '2022-06-06 15:36:19');
INSERT INTO `photos` VALUES ('1533714395408916482', '1533714280887640065', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/3c84477177014e0fbfb104b5b13d2bbf640.webp', 0, '2022-06-06 15:36:22', '2022-06-06 15:36:22');
INSERT INTO `photos` VALUES ('1533714406322495489', '1533714280887640065', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/3858e765abd14e2e9044192282340fb9181001434895.webp', 0, '2022-06-06 15:36:24', '2022-06-06 15:36:24');
INSERT INTO `photos` VALUES ('1533714423619805185', '1533714280887640065', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/8c98c798f2c04dc5b7c140320689a793181002066807.webp', 0, '2022-06-06 15:36:28', '2022-06-06 15:36:28');
INSERT INTO `photos` VALUES ('1533714433304453122', '1533714280887640065', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/391a78d40f1a43ec9fca2902f2d03e06181002165846.webp', 0, '2022-06-06 15:36:31', '2022-06-06 15:36:31');
INSERT INTO `photos` VALUES ('1533763634482667521', '1533763612873613313', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/14049e4f44934977b7cf90a072aece96180956137467.webp', 0, '2022-06-06 18:52:01', '2022-06-06 18:52:01');
INSERT INTO `photos` VALUES ('1533763645203308546', '1533763612873613313', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/6feafc85e3c5400cab3332389a06e344180956514978.webp', 0, '2022-06-06 18:52:04', '2022-06-06 18:52:04');
INSERT INTO `photos` VALUES ('1533763653247983617', '1533763612873613313', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/1a982e3359ce47d9807446245e95d277180957333320.webp', 0, '2022-06-06 18:52:06', '2022-06-06 18:52:06');
INSERT INTO `photos` VALUES ('1533763663712772098', '1533763612873613313', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/5f326ccc193d438787e2c4d6c2bb9fa0180958133178.webp', 0, '2022-06-06 18:52:08', '2022-06-06 18:52:08');
INSERT INTO `photos` VALUES ('1533763681068802050', '1533763612873613313', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/d4eab9e432b7427f8310fd134bc1f492180957532387.webp', 0, '2022-06-06 18:52:12', '2022-06-06 18:52:12');
INSERT INTO `photos` VALUES ('1533763691286126594', '1533763612873613313', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/1168363fe5724954bdf3fe8f00d4838b180958354138.webp', 0, '2022-06-06 18:52:15', '2022-06-06 18:52:15');
INSERT INTO `photos` VALUES ('1533763701713166338', '1533763612873613313', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/95abccbe528142c1816232c54c0b3e28180958513556.webp', 0, '2022-06-06 18:52:17', '2022-06-06 18:52:17');
INSERT INTO `photos` VALUES ('1533763717475360769', '1533763612873613313', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/c44d394ac39241ce83cbf2ff9e2938c0180959494507.webp', 0, '2022-06-06 18:52:21', '2022-06-06 18:52:21');
INSERT INTO `photos` VALUES ('1533763723364163586', '1533763612873613313', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/eef1a4cb33a04715b294fa7d5b36da97180959592482.webp', 0, '2022-06-06 18:52:22', '2022-06-06 18:52:22');
INSERT INTO `photos` VALUES ('1533765289919930370', '1533765264175292417', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/85683a1cf2d844b48d4b5d9f42517b1c640 (1).webp', 0, '2022-06-06 18:58:36', '2022-06-06 18:58:36');
INSERT INTO `photos` VALUES ('1533765297687781378', '1533765264175292417', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/2179b15bab8d4d69b12c12224d506cd6640 (2).webp', 0, '2022-06-06 18:58:38', '2022-06-06 18:58:38');
INSERT INTO `photos` VALUES ('1533765304969093121', '1533765264175292417', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/59648a4fc55c4ee5a56e10b33ce8a185640 (3).webp', 0, '2022-06-06 18:58:39', '2022-06-06 18:58:39');
INSERT INTO `photos` VALUES ('1533765313647108098', '1533765264175292417', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/edbcbbf31c894b21a984d11a02eef6f8640 (4).webp', 0, '2022-06-06 18:58:41', '2022-06-06 18:58:41');
INSERT INTO `photos` VALUES ('1533765328218120193', '1533765264175292417', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/087ae9d1c13640c7a2766f517387ddc6640 (5).webp', 0, '2022-06-06 18:58:45', '2022-06-06 18:58:45');
INSERT INTO `photos` VALUES ('1533765338167009282', '1533765264175292417', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/7157d6a74af74e6fb272ba27e58f13c9640 (6).webp', 0, '2022-06-06 18:58:47', '2022-06-06 18:58:47');
INSERT INTO `photos` VALUES ('1533765352842878977', '1533765264175292417', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/b9dcb44095984817915953e576176158640 (7).webp', 0, '2022-06-06 18:58:51', '2022-06-06 18:58:51');
INSERT INTO `photos` VALUES ('1533765361508311042', '1533765264175292417', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/b34717a5ab964bdea7e0e96f3b5877bc640 (8).webp', 0, '2022-06-06 18:58:53', '2022-06-06 18:58:53');
INSERT INTO `photos` VALUES ('1533765370484121601', '1533765264175292417', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/10759952c41e454b95b4d4c08fec07e6640 (9).webp', 0, '2022-06-06 18:58:55', '2022-06-06 18:58:55');
INSERT INTO `photos` VALUES ('1533765382932815874', '1533765264175292417', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/fed9636464ba4b959ac88cd1d4cef687640 (12).webp', 0, '2022-06-06 18:58:58', '2022-06-06 18:58:58');
INSERT INTO `photos` VALUES ('1533765392088981505', '1533765264175292417', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/9598492d97ea4c1c97a2501f1af137e7640 (13).webp', 0, '2022-06-06 18:59:00', '2022-06-06 18:59:00');
INSERT INTO `photos` VALUES ('1533765403325521921', '1533765264175292417', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/9e79b534b04e44cb91d321af92d2a8c1640 (14).webp', 0, '2022-06-06 18:59:03', '2022-06-06 18:59:03');
INSERT INTO `photos` VALUES ('1533765413307965441', '1533765264175292417', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/f33bdb07501f49a195740e77f91e7772640 (15).webp', 0, '2022-06-06 18:59:05', '2022-06-06 18:59:05');
INSERT INTO `photos` VALUES ('1533765680443187202', '1533765653155045378', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/c42a6665d2964dcd9c106dba433efe7e640 (1).webp', 0, '2022-06-06 19:00:09', '2022-06-06 19:00:09');
INSERT INTO `photos` VALUES ('1533765688374616065', '1533765653155045378', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/5f4c8d743eb7469c814fa5915f66cd5f640 (2).webp', 0, '2022-06-06 19:00:11', '2022-06-06 19:00:11');
INSERT INTO `photos` VALUES ('1533765696318627841', '1533765653155045378', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/a1c5766df6e54faaa4120f706ffd1b08640 (3).webp', 0, '2022-06-06 19:00:13', '2022-06-06 19:00:13');
INSERT INTO `photos` VALUES ('1533765705843892226', '1533765653155045378', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/d1ae70b570a04345a2bacf8a918c7239640 (4).webp', 0, '2022-06-06 19:00:15', '2022-06-06 19:00:15');
INSERT INTO `photos` VALUES ('1533765713364279297', '1533765653155045378', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/8199eb3276044dd5a9d1c66b95d4e624640 (5).webp', 0, '2022-06-06 19:00:17', '2022-06-06 19:00:17');
INSERT INTO `photos` VALUES ('1533765725758447618', '1533765653155045378', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/02d9c644129f42529533b4c11d127482640.webp', 0, '2022-06-06 19:00:20', '2022-06-06 19:00:20');
INSERT INTO `photos` VALUES ('1533766099265413121', '1533766068005265410', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/88a053fbd0d74f93bd4dfc76e1f854fb640 (1).webp', 0, '2022-06-06 19:01:49', '2022-06-06 19:01:49');
INSERT INTO `photos` VALUES ('1533766107154898946', '1533766068005265410', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/4c948ca6573544c4951fc3d87fa21886640 (2).webp', 0, '2022-06-06 19:01:51', '2022-06-06 19:01:51');
INSERT INTO `photos` VALUES ('1533766115077939202', '1533766068005265410', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/217fb018f9f04908a2ea4a775c0b7e61640 (3).webp', 0, '2022-06-06 19:01:52', '2022-06-06 19:01:52');
INSERT INTO `photos` VALUES ('1533766122141147138', '1533766068005265410', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/6ed31350772a408f9338dd94587efc08640 (4).webp', 0, '2022-06-06 19:01:54', '2022-06-06 19:01:54');
INSERT INTO `photos` VALUES ('1533766130022244353', '1533766068005265410', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/58fa726f0f9842038aefd8689fbd67e9640 (5).webp', 0, '2022-06-06 19:01:56', '2022-06-06 19:01:56');
INSERT INTO `photos` VALUES ('1533766142114422785', '1533766068005265410', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/3cba003e29264817bb903bd53cd5a3f9640 (6).webp', 0, '2022-06-06 19:01:59', '2022-06-06 19:01:59');
INSERT INTO `photos` VALUES ('1533766149597061121', '1533766068005265410', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/699ba390dc594717a5c516967af3cf9d640.webp', 0, '2022-06-06 19:02:01', '2022-06-06 19:02:01');
INSERT INTO `photos` VALUES ('1533766157713039361', '1533766068005265410', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/b4a313de6f724ee8a31c836bd5f479bc641.webp', 0, '2022-06-06 19:02:03', '2022-06-06 19:02:03');
INSERT INTO `photos` VALUES ('1533767231907848193', '1533766340786020354', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/a64eaf973d8d49608f53d5cda6581f10181029587953.webp', 0, '2022-06-06 19:06:19', '2022-06-06 19:06:19');
INSERT INTO `photos` VALUES ('1533767239923163138', '1533766340786020354', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/033a5cf693f341c9b7fa59c2fb99dbd9181031369132.webp', 0, '2022-06-06 19:06:21', '2022-06-06 19:06:21');
INSERT INTO `photos` VALUES ('1533767248089473026', '1533766340786020354', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/75289cf30c83455980feec4f7a5d5a71181031492285.webp', 0, '2022-06-06 19:06:23', '2022-06-06 19:06:23');
INSERT INTO `photos` VALUES ('1533767573680709633', '1533767541460066306', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/00d97ee20178443ba65090a3f664db84181022445240.webp', 0, '2022-06-06 19:07:40', '2022-06-06 19:07:40');
INSERT INTO `photos` VALUES ('1533767581935099906', '1533767541460066306', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/47a7191a9dda4d3b8ef61461f73912de181023287939.webp', 0, '2022-06-06 19:07:42', '2022-06-06 19:07:42');
INSERT INTO `photos` VALUES ('1533767589895888898', '1533767541460066306', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/fb695617ab814d808385bbca9211d7bc181023409670.webp', 0, '2022-06-06 19:07:44', '2022-06-06 19:07:44');
INSERT INTO `photos` VALUES ('1533767970877104130', '1533767904238002177', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/7a5c2806fca04d7393e2f7274633aa03640 (3).webp', 0, '2022-06-06 19:09:15', '2022-06-06 19:09:15');
INSERT INTO `photos` VALUES ('1533767980289122305', '1533767904238002177', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/0f3ee390d2604aeba43de8286c9079c5640.webp', 0, '2022-06-06 19:09:17', '2022-06-06 19:09:17');
INSERT INTO `photos` VALUES ('1533767987603988481', '1533767904238002177', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/f7d0d71d03184c788d369e9b631b9025181015513276.webp', 0, '2022-06-06 19:09:19', '2022-06-06 19:09:19');
INSERT INTO `photos` VALUES ('1533767994767859713', '1533767904238002177', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/f4a556050e4542248e9b98e7728b2e98181016385306.webp', 0, '2022-06-06 19:09:21', '2022-06-06 19:09:21');
INSERT INTO `photos` VALUES ('1533768002980306946', '1533767904238002177', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/8ca74962b31f4b4daa542d5c0f65f2d5181016528753.webp', 0, '2022-06-06 19:09:23', '2022-06-06 19:09:23');
INSERT INTO `photos` VALUES ('1533768010928513025', '1533767904238002177', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/e23ee79771034e67b198d41bc42258a8181017245226.webp', 0, '2022-06-06 19:09:25', '2022-06-06 19:09:25');
INSERT INTO `photos` VALUES ('1533768018973188098', '1533767904238002177', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/e7a6103c69ab4a2791ad55bcafd13208181017419463.webp', 0, '2022-06-06 19:09:26', '2022-06-06 19:09:26');
INSERT INTO `photos` VALUES ('1533768026694901762', '1533767904238002177', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/44ed9e0189b043f7a4d2cf0c7775e225181018006305.webp', 0, '2022-06-06 19:09:28', '2022-06-06 19:09:28');
INSERT INTO `photos` VALUES ('1533768034542444546', '1533767904238002177', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/04c6d5e72def48c59fe4dbcf02656e41181018124996.webp', 0, '2022-06-06 19:09:30', '2022-06-06 19:09:30');
INSERT INTO `photos` VALUES ('1533768043472117762', '1533767904238002177', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/8ebf2cc3e6384705a0e21942155be473181018303932.webp', 0, '2022-06-06 19:09:32', '2022-06-06 19:09:32');
INSERT INTO `photos` VALUES ('1533768407357349889', '1533768369625391106', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/ccbd6c7af7be4534a1c4ae40900a279a640 (1).webp', 0, '2022-06-06 19:10:59', '2022-06-06 19:10:59');
INSERT INTO `photos` VALUES ('1533768416177971201', '1533768369625391106', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/20aa6b08e80f4bef8323d996b8458c40640 (2).webp', 0, '2022-06-06 19:11:01', '2022-06-06 19:11:01');
INSERT INTO `photos` VALUES ('1533768424914706434', '1533768369625391106', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/035c3692d2734ceb97733af4cee040fc640.webp', 0, '2022-06-06 19:11:03', '2022-06-06 19:11:03');
INSERT INTO `photos` VALUES ('1533768435975086082', '1533768369625391106', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/03300e2df4f048a5a834cc68cac10c48071413109963.webp', 0, '2022-06-06 19:11:06', '2022-06-06 19:11:06');
INSERT INTO `photos` VALUES ('1533768443776491521', '1533768369625391106', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/28d9901d955c41a488c8a2fca775a819071413109963.webp', 1, '2022-06-06 19:11:08', '2022-06-06 19:11:08');
INSERT INTO `photos` VALUES ('1533768455285661698', '1533768369625391106', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/1bececf3f0df4371a0415df98dda09ee071414175343.webp', 0, '2022-06-06 19:11:10', '2022-06-06 19:11:10');
INSERT INTO `photos` VALUES ('1533768463246450689', '1533768369625391106', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/4067ef5ab5254c2a8a0016880aa7804f071414268294.webp', 0, '2022-06-06 19:11:12', '2022-06-06 19:11:12');
INSERT INTO `photos` VALUES ('1533768471710556161', '1533768369625391106', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/ccdeee8ce321419ca4cb43dc213f068f071414391650.webp', 0, '2022-06-06 19:11:14', '2022-06-06 19:11:14');
INSERT INTO `photos` VALUES ('1533768479117697026', '1533768369625391106', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/e8ac5df4303d4d6fb4531cab7acf54e7071414391650.webp', 1, '2022-06-06 19:11:16', '2022-06-06 19:11:16');
INSERT INTO `photos` VALUES ('1533768506686857218', '1533768369625391106', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/02992770088a41f38b387dd97b62360a071414506675.webp', 0, '2022-06-06 19:11:23', '2022-06-06 19:11:23');
INSERT INTO `photos` VALUES ('1533768515687833602', '1533768369625391106', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/7602e9656f53464b860a5b3bdc048a87071415009975.webp', 0, '2022-06-06 19:11:25', '2022-06-06 19:11:25');
INSERT INTO `photos` VALUES ('1533769466758848513', '1533769427068149762', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/f285da735fc84e58ac2d1ac775bc65782AAFF26BC5C38B8EB9F9083B37DF0BCC7B88BD1E_w1151_h767.webp', 0, '2022-06-06 19:15:12', '2022-06-06 19:15:12');
INSERT INTO `photos` VALUES ('1533769474950324226', '1533769427068149762', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/ac313061499e487c81b1f5e6f1701ddd231838253206.webp', 0, '2022-06-06 19:15:14', '2022-06-06 19:15:14');
INSERT INTO `photos` VALUES ('1533769483158577153', '1533769427068149762', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/68a5b83aecf543b2b476101b02595afc231839487604.webp', 0, '2022-06-06 19:15:16', '2022-06-06 19:15:16');
INSERT INTO `photos` VALUES ('1533769490708324354', '1533769427068149762', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/bfd5585103d5453992260b2748a8f412R-C (1).webp', 0, '2022-06-06 19:15:17', '2022-06-06 19:15:17');
INSERT INTO `photos` VALUES ('1533769498094493697', '1533769427068149762', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/be65c7146e104c4dad1f511b4e77a5aaR-C (2).webp', 0, '2022-06-06 19:15:19', '2022-06-06 19:15:19');
INSERT INTO `photos` VALUES ('1533770042603233281', '1533769969991442433', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/ada407e58b654237b84f5c1ded93d927231421263089.webp', 0, '2022-06-06 19:17:29', '2022-06-06 19:17:29');
INSERT INTO `photos` VALUES ('1533770043303682050', '1533769969991442433', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/30f287cebe534a36ac45035de2feae06231421484965.webp', 0, '2022-06-06 19:17:29', '2022-06-06 19:17:29');
INSERT INTO `photos` VALUES ('1533770051620986881', '1533769969991442433', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/61bd48a6e8614321ad379f317a87154eR-C (1).webp', 0, '2022-06-06 19:17:31', '2022-06-06 19:17:31');
INSERT INTO `photos` VALUES ('1533770058159906817', '1533769969991442433', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/08e40ffea55e4786bed7d9afdc406d4aR-C (2).webp', 0, '2022-06-06 19:17:33', '2022-06-06 19:17:33');
INSERT INTO `photos` VALUES ('1533770066590457857', '1533769969991442433', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/dc5d4e53a71844eeaa66a6ef7ef220b7R-C.webp', 0, '2022-06-06 19:17:35', '2022-06-06 19:17:35');
INSERT INTO `photos` VALUES ('1533770446103666689', '1533770426839228418', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/da6de641db3947009c8e8ae7e9c1ebc6100s15000000yfyvl9F94.webp', 0, '2022-06-06 19:19:05', '2022-06-06 19:19:05');
INSERT INTO `photos` VALUES ('1533770453519196161', '1533770426839228418', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/a6e7b5f6b3614fa5951b07e12cfa1325640 (2).webp', 0, '2022-06-06 19:19:07', '2022-06-06 19:19:07');
INSERT INTO `photos` VALUES ('1533770463459696641', '1533770426839228418', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/32d5346dc3ac4dd69446ae045a7158dc231601255606.webp', 0, '2022-06-06 19:19:09', '2022-06-06 19:19:09');
INSERT INTO `photos` VALUES ('1533770472380981250', '1533770426839228418', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/baabd69143514e4a85f151dcff306efe201602181331227437.webp', 0, '2022-06-06 19:19:11', '2022-06-06 19:19:11');
INSERT INTO `photos` VALUES ('1533770480253689857', '1533770426839228418', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/71eaa53a59a048998b69e18599933c19R-C.webp', 0, '2022-06-06 19:19:13', '2022-06-06 19:19:13');
INSERT INTO `photos` VALUES ('1533770735196069889', '1533770687578136577', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/7e5c53f2b5654ba8a5e59948a596f051181422207945.webp', 0, '2022-06-06 19:20:14', '2022-06-06 19:20:14');
INSERT INTO `photos` VALUES ('1533770743538540545', '1533770687578136577', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/07243f4ac44f4a2691c75be1c73f4c48R-C (2).webp', 0, '2022-06-06 19:20:16', '2022-06-06 19:20:16');
INSERT INTO `photos` VALUES ('1533770751528689665', '1533770687578136577', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/c25655e09ea241c7b977d0e78c9c01e3R-C (3).webp', 0, '2022-06-06 19:20:18', '2022-06-06 19:20:18');
INSERT INTO `photos` VALUES ('1533770758927441922', '1533770687578136577', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/aaf555a4fa474640b0b49cc9a332321dR-C (4).webp', 0, '2022-06-06 19:20:20', '2022-06-06 19:20:20');
INSERT INTO `photos` VALUES ('1533770766787567617', '1533770687578136577', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/65ab0fb482ef46fd8214f2a5a56e7a31R-C.webp', 0, '2022-06-06 19:20:22', '2022-06-06 19:20:22');
INSERT INTO `photos` VALUES ('1533771523800719361', '1533771501742874626', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/bd4de8f1948c4fa5a8fa0c1d523097202a71cf2a-aa75-4e8f-b715-1b0a452bc608.webp', 0, '2022-06-06 19:23:22', '2022-06-06 19:23:22');
INSERT INTO `photos` VALUES ('1533771535314083841', '1533771501742874626', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/ced60d31f9e94ccbb5a67975288fdacf6cecdcab-60cc-4c74-966a-ef7d74823d10.webp', 0, '2022-06-06 19:23:25', '2022-06-06 19:23:25');
INSERT INTO `photos` VALUES ('1533771544285700098', '1533771501742874626', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/ee23a9fd8fee4f72afcbb5acea25439059b5c539-c771-40c2-b31f-19e091b82672.webp', 0, '2022-06-06 19:23:27', '2022-06-06 19:23:27');
INSERT INTO `photos` VALUES ('1533771557657141250', '1533771501742874626', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/d25a19d473be40f3ab11776997b1c79a167ba78a-1e5e-47b1-a4a2-186724853c27.webp', 0, '2022-06-06 19:23:30', '2022-06-06 19:23:30');
INSERT INTO `photos` VALUES ('1533771567513755649', '1533771501742874626', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/79672851752445039cb4b9d5bea222889eeb9272-43de-4b3c-b77e-17403d7e32d9.webp', 0, '2022-06-06 19:23:32', '2022-06-06 19:23:32');
INSERT INTO `photos` VALUES ('1533771593942065153', '1533771501742874626', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/c52be8d666b44ed9b2923ba2eea310c1057a713e-a79a-4f09-861b-9517df07f1b4.webp', 0, '2022-06-06 19:23:39', '2022-06-06 19:23:39');
INSERT INTO `photos` VALUES ('1533771602422947842', '1533771501742874626', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/c078bb2143044d2899433d6711ecebcc423c971e-b3dc-4e35-8577-4f6616eeac9f.webp', 0, '2022-06-06 19:23:41', '2022-06-06 19:23:41');
INSERT INTO `photos` VALUES ('1533771610446651394', '1533771501742874626', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/f7a6c33591fd46c2ab89a620746bfb062448ac02-4edb-4cbb-8f7a-a70addd46302.webp', 0, '2022-06-06 19:23:43', '2022-06-06 19:23:43');
INSERT INTO `photos` VALUES ('1533771618092867586', '1533771501742874626', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/745f37abe1d6487f968a713927f9eae32908b43e-9bff-421a-9463-8842522dc245.webp', 0, '2022-06-06 19:23:45', '2022-06-06 19:23:45');
INSERT INTO `photos` VALUES ('1533771626984792065', '1533771501742874626', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/9eaf9480a85b4156b90e1ea3be9a10f07323a60b-2637-4084-a761-e338df69ebd4.webp', 0, '2022-06-06 19:23:47', '2022-06-06 19:23:47');
INSERT INTO `photos` VALUES ('1533771637923536897', '1533771501742874626', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/3d5377d554be47b48496550b491f6d6325865d14-6f7e-4423-8f6d-b92531f66bdf.webp', 0, '2022-06-06 19:23:49', '2022-06-06 19:23:49');
INSERT INTO `photos` VALUES ('1533771655313121281', '1533771501742874626', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/25b57ecab2514c4882799828ef2853177323a60b-2637-4084-a761-e338df69ebd4.webp', 0, '2022-06-06 19:23:53', '2022-06-06 19:23:53');
INSERT INTO `photos` VALUES ('1533771666142814210', '1533771501742874626', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/cfcb0794c5074840bebae9facf0f1c0d25865d14-6f7e-4423-8f6d-b92531f66bdf.webp', 0, '2022-06-06 19:23:56', '2022-06-06 19:23:56');
INSERT INTO `photos` VALUES ('1533771672593653762', '1533771501742874626', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/959e3d265e414db2a2d0eb7acdb2448e8153164e-5e59-4756-bec4-a983decabddd.webp', 0, '2022-06-06 19:23:58', '2022-06-06 19:23:58');
INSERT INTO `photos` VALUES ('1533771683159105538', '1533771501742874626', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/b18e1ecdc0a64d9baf536dbfac31c3e2231612289632.webp', 0, '2022-06-06 19:24:00', '2022-06-06 19:24:00');
INSERT INTO `photos` VALUES ('1533771691946172418', '1533771501742874626', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/56d8b4437d9b44808fc4dfc6a73bd614231612487987.webp', 0, '2022-06-06 19:24:02', '2022-06-06 19:24:02');
INSERT INTO `photos` VALUES ('1533771701089755138', '1533771501742874626', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/985766398cca45e384e6ddb08d0e96e6231613073417.webp', 0, '2022-06-06 19:24:04', '2022-06-06 19:24:04');
INSERT INTO `photos` VALUES ('1533771711734898690', '1533771501742874626', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/dbb63a873aac482caaa939f55b3184eba0ce49be-9b51-472b-b3e4-6307e540c3c0.webp', 0, '2022-06-06 19:24:07', '2022-06-06 19:24:07');
INSERT INTO `photos` VALUES ('1533771726826004482', '1533771501742874626', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/a5a436cfe6a5471496170320acf35850a9d01c60-a6d4-48f9-a308-1e8e254b487b.webp', 0, '2022-06-06 19:24:10', '2022-06-06 19:24:10');
INSERT INTO `photos` VALUES ('1533771735189446657', '1533771501742874626', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/8dfac44346984512a2458de10a0953dfaa919348-0c4f-4b89-9c4c-3a6358a808b0.webp', 0, '2022-06-06 19:24:12', '2022-06-06 19:24:12');
INSERT INTO `photos` VALUES ('1533771744945397761', '1533771501742874626', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/c2936c80ed93471ea1739ede7e2c1ad9ae30d0cb-014a-4b71-bc29-8a1a949a55b4.webp', 0, '2022-06-06 19:24:15', '2022-06-06 19:24:15');
INSERT INTO `photos` VALUES ('1533771754223198210', '1533771501742874626', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/688f6aca78c043b78975109fb945189ab16f3d5a-a72b-4ee4-b8c5-74d97cbab6c5.webp', 0, '2022-06-06 19:24:17', '2022-06-06 19:24:17');
INSERT INTO `photos` VALUES ('1533771770908139522', '1533771501742874626', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/b5a6057c14064412ac026956b6ad4f11c9a31a40-1822-47da-ac6a-cd351e73c097.webp', 0, '2022-06-06 19:24:21', '2022-06-06 19:24:21');
INSERT INTO `photos` VALUES ('1533771783973396482', '1533771501742874626', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/500f86a5bb4d4b70a9070409f9eeba2dc0072827-5154-4cc7-a8c0-77f002d126cb.webp', 0, '2022-06-06 19:24:24', '2022-06-06 19:24:24');
INSERT INTO `photos` VALUES ('1533771794828255234', '1533771501742874626', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/c1d50fcdd09143d9afa62afcef97b976d8f28d28-8d35-47bc-b973-414be7cbcb6c.webp', 0, '2022-06-06 19:24:27', '2022-06-06 19:24:27');
INSERT INTO `photos` VALUES ('1533771803506270209', '1533771501742874626', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/577c1f48f89e45dba6de2c1b026f6648da8d9f4b-b8ef-45ca-a2eb-4cccc0fca99b.webp', 0, '2022-06-06 19:24:29', '2022-06-06 19:24:29');
INSERT INTO `photos` VALUES ('1533771814948331521', '1533771501742874626', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/8c302937866b4cab9d69617895039a3eebdced09-9236-4003-bd2b-c0c1db96668a.webp', 0, '2022-06-06 19:24:31', '2022-06-06 19:24:31');
INSERT INTO `photos` VALUES ('1533772158034010113', '1533772130812977154', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/286ba9279db6444085c37310486615fc005uUBDQgy1gtzp1secpgj60u00j3diw012.webp', 0, '2022-06-06 19:25:53', '2022-06-06 19:25:53');
INSERT INTO `photos` VALUES ('1533772166053519361', '1533772130812977154', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/0f3f7d6731744a08b8a5beca1f006c0d640 (2).webp', 0, '2022-06-06 19:25:55', '2022-06-06 19:25:55');
INSERT INTO `photos` VALUES ('1533772174911889409', '1533772130812977154', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/5dbb0253da3a4c9aafbd9a9ae7217a09640 (3).webp', 0, '2022-06-06 19:25:57', '2022-06-06 19:25:57');
INSERT INTO `photos` VALUES ('1533772183065616385', '1533772130812977154', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/a69f14b9712e468dab61d7d720ba1225640 (4).webp', 0, '2022-06-06 19:25:59', '2022-06-06 19:25:59');
INSERT INTO `photos` VALUES ('1533772190346928130', '1533772130812977154', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/50e4e7ee4f8e4fe3a262ca9154568550640.webp', 0, '2022-06-06 19:26:01', '2022-06-06 19:26:01');
INSERT INTO `photos` VALUES ('1533772198232219649', '1533772130812977154', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/3f7b0951cfdd4f399647349d90bbe8951611825758675923-750_480.webp', 0, '2022-06-06 19:26:03', '2022-06-06 19:26:03');
INSERT INTO `photos` VALUES ('1533772209590394881', '1533772130812977154', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/b7634a4eae39411a8d9140aef494ebe1R-C (1).webp', 0, '2022-06-06 19:26:06', '2022-06-06 19:26:06');
INSERT INTO `photos` VALUES ('1533772217240805378', '1533772130812977154', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/524cf6165a6a4e9e89ed04660147e1f7R-C (2).webp', 0, '2022-06-06 19:26:07', '2022-06-06 19:26:07');
INSERT INTO `photos` VALUES ('1533772225662967809', '1533772130812977154', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/da585ed562144f8abc4d1f72a2c9c9daR-C.webp', 0, '2022-06-06 19:26:09', '2022-06-06 19:26:09');
INSERT INTO `photos` VALUES ('1533772397776232450', '1533772378562125825', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/b6625238c19149d18719641af46b3ca2640 (1).webp', 0, '2022-06-06 19:26:50', '2022-06-06 19:26:50');
INSERT INTO `photos` VALUES ('1533772405514723330', '1533772378562125825', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/98682f4ee0634ef2a3f3226bf04d4b1e640 (3).webp', 0, '2022-06-06 19:26:52', '2022-06-06 19:26:52');
INSERT INTO `photos` VALUES ('1533772412028477442', '1533772378562125825', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/283a67ea434c49dc95b60eb2d7858f32640.webp', 0, '2022-06-06 19:26:54', '2022-06-06 19:26:54');
INSERT INTO `photos` VALUES ('1533772422384214017', '1533772378562125825', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/c4c1fc2f24a044c78e5906d36fbe7932R-C (1).webp', 0, '2022-06-06 19:26:56', '2022-06-06 19:26:56');
INSERT INTO `photos` VALUES ('1533772429950738433', '1533772378562125825', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/cee2aedcefbf4c48b5821d070e3ebb14R-C.webp', 0, '2022-06-06 19:26:58', '2022-06-06 19:26:58');
INSERT INTO `photos` VALUES ('1533772978217574401', '1533772938916945922', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/87241eef08b248729d97a811915b5687R-C (1).webp', 0, '2022-06-06 19:29:09', '2022-06-06 19:29:09');
INSERT INTO `photos` VALUES ('1533772986908172290', '1533772938916945922', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/095883e42dd345899d7f78d858fc5420R-C (2).webp', 0, '2022-06-06 19:29:11', '2022-06-06 19:29:11');
INSERT INTO `photos` VALUES ('1533772994420170754', '1533772938916945922', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/0eb0968313c7423caba7e5f5c6e04ffcR-C (3).webp', 0, '2022-06-06 19:29:13', '2022-06-06 19:29:13');
INSERT INTO `photos` VALUES ('1533773001651150849', '1533772938916945922', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/97793fffeb3e4e41a8f0393b30ac663fR-C.webp', 0, '2022-06-06 19:29:14', '2022-06-06 19:29:14');
INSERT INTO `photos` VALUES ('1533773009385447425', '1533772938916945922', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/4e12451d251244e694467fda4e446237R-C1.webp', 0, '2022-06-06 19:29:16', '2022-06-06 19:29:16');
INSERT INTO `photos` VALUES ('1533773276524863489', '1533773250046222337', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/93ae957039aa42e9b308c9bcd4cab990640 (1).webp', 0, '2022-06-06 19:30:20', '2022-06-06 19:30:20');
INSERT INTO `photos` VALUES ('1533773284372406274', '1533773250046222337', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/6c4e416dc4774b078d727c2f445d52f4640 (2).webp', 0, '2022-06-06 19:30:22', '2022-06-06 19:30:22');
INSERT INTO `photos` VALUES ('1533773291511111681', '1533773250046222337', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/5d465384eb4d4cc5a70c3d200d97daa8640 (3).webp', 0, '2022-06-06 19:30:23', '2022-06-06 19:30:23');
INSERT INTO `photos` VALUES ('1533773298775646210', '1533773250046222337', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/bedb50b8c3754274a14bbc13276a9835640 (4).webp', 0, '2022-06-06 19:30:25', '2022-06-06 19:30:25');
INSERT INTO `photos` VALUES ('1533773306522525697', '1533773250046222337', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/8e2428864be04f72b856c7cea4d6baba640.webp', 0, '2022-06-06 19:30:27', '2022-06-06 19:30:27');
INSERT INTO `photos` VALUES ('1533773313636065282', '1533773250046222337', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/b9455cd344d5474882ee4b2b23fb27ad231404408122.webp', 0, '2022-06-06 19:30:29', '2022-06-06 19:30:29');
INSERT INTO `photos` VALUES ('1533773322846756866', '1533773250046222337', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/1235ed91a34b470986fc9e73b713eb0b231406007812.webp', 0, '2022-06-06 19:30:31', '2022-06-06 19:30:31');
INSERT INTO `photos` VALUES ('1533773561087418369', '1533773542359851010', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/2ca5117af2db43478611131334fe6204161525325945.webp', 0, '2022-06-06 19:31:28', '2022-06-06 19:31:28');
INSERT INTO `photos` VALUES ('1533773568507142145', '1533773542359851010', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/fecd916b077e40d5983ecc3353153b74161526059465.webp', 0, '2022-06-06 19:31:30', '2022-06-06 19:31:30');
INSERT INTO `photos` VALUES ('1533773575536795649', '1533773542359851010', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/2896d9ece55548ea854d816f3c342c3dR-C (1).webp', 0, '2022-06-06 19:31:31', '2022-06-06 19:31:31');
INSERT INTO `photos` VALUES ('1533773584671989762', '1533773542359851010', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/c9454479926a4b7ba55271850db9eddeR-C (2).webp', 0, '2022-06-06 19:31:33', '2022-06-06 19:31:33');
INSERT INTO `photos` VALUES ('1533773594742513666', '1533773542359851010', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/5080e2bee3bf46ec9eaad954d11af73eR-C.webp', 0, '2022-06-06 19:31:36', '2022-06-06 19:31:36');
INSERT INTO `photos` VALUES ('1533773608013291522', '1533773542359851010', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/5e343b23f04b44ab86772860c07f7febR-C1.webp', 0, '2022-06-06 19:31:39', '2022-06-06 19:31:39');
INSERT INTO `photos` VALUES ('1533774127893078018', '1533774103033438209', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/e75679b386d84579818feb4983b1ac9b8b00edcde196437f8d3a2be5e60f7202.webp', 0, '2022-06-06 19:33:43', '2022-06-06 19:33:43');
INSERT INTO `photos` VALUES ('1533774134796902402', '1533774103033438209', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/0cff2c94d796445f885a53f526273d9d242053221067.webp', 0, '2022-06-06 19:33:45', '2022-06-06 19:33:45');
INSERT INTO `photos` VALUES ('1533774142816411650', '1533774103033438209', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/18dd639bc9a54a31b1e9ea7af92f75b9242053321168.webp', 0, '2022-06-06 19:33:46', '2022-06-06 19:33:46');
INSERT INTO `photos` VALUES ('1533774150768812034', '1533774103033438209', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/c8c1ff8afa424a4fb9c0563e66b6cb9d242053435411.webp', 0, '2022-06-06 19:33:48', '2022-06-06 19:33:48');
INSERT INTO `photos` VALUES ('1533774158389862402', '1533774103033438209', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/5f84bf1a274f4eafbd86d9eda32f1ecc242053529798.webp', 0, '2022-06-06 19:33:50', '2022-06-06 19:33:50');
INSERT INTO `photos` VALUES ('1533774329920118786', '1533774303730884609', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/2c59726b740a44a3a5f4206eeef5566e231418158582.webp', 0, '2022-06-06 19:34:31', '2022-06-06 19:34:31');
INSERT INTO `photos` VALUES ('1533774338497470465', '1533774303730884609', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/df7c6decc95e4541848aa126bc3004cdR-C (1).webp', 0, '2022-06-06 19:34:33', '2022-06-06 19:34:33');
INSERT INTO `photos` VALUES ('1533774347016101890', '1533774303730884609', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/f731ef6919eb4aba93b2f265618fe5f9R-C.webp', 0, '2022-06-06 19:34:35', '2022-06-06 19:34:35');
INSERT INTO `photos` VALUES ('1533774352208650242', '1533774303730884609', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/366299a2e877448099e72fc6a76402f5R-C2.webp', 0, '2022-06-06 19:34:36', '2022-06-06 19:34:36');
INSERT INTO `photos` VALUES ('1533774359158611970', '1533774303730884609', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/bc22cb896b0d45ca8e38cfce4fe74a65t01761ba17a0ae0275a.webp', 0, '2022-06-06 19:34:38', '2022-06-06 19:34:38');
INSERT INTO `photos` VALUES ('1533774674817736706', '1533774645596020737', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/739b5dc455d84685a93a24cc20fd2b69181412365919.webp', 0, '2022-06-06 19:35:53', '2022-06-06 19:35:53');
INSERT INTO `photos` VALUES ('1533774682329735169', '1533774645596020737', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/6b17968ea5db4429b14b7c230107fc9d181459406692.webp', 0, '2022-06-06 19:35:55', '2022-06-06 19:35:55');
INSERT INTO `photos` VALUES ('1533774690202443778', '1533774645596020737', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/fff6d08c78e64b42a15b338382cb9692181459579938.webp', 0, '2022-06-06 19:35:57', '2022-06-06 19:35:57');
INSERT INTO `photos` VALUES ('1533774697706053633', '1533774645596020737', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/02100fa228c240e69b8e7ba52ccea06b181501373010.webp', 0, '2022-06-06 19:35:59', '2022-06-06 19:35:59');
INSERT INTO `photos` VALUES ('1533774709651431425', '1533774645596020737', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/adda9205cea04a3ba4dd9fb84a8313d5R-C (2).webp', 0, '2022-06-06 19:36:02', '2022-06-06 19:36:02');
INSERT INTO `photos` VALUES ('1533774717293453314', '1533774645596020737', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/dac7cb3a599d4663a30bac14d24997dcR-C.webp', 0, '2022-06-06 19:36:03', '2022-06-06 19:36:03');
INSERT INTO `photos` VALUES ('1533774724646068225', '1533774645596020737', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/8e5bed9d853642cbb5f0e83f434b0dabR-C2.webp', 0, '2022-06-06 19:36:05', '2022-06-06 19:36:05');
INSERT INTO `photos` VALUES ('1533775149143187457', '1533775128150695938', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/bf132a798a0f45ae98eb200eefb365208d29b535-903d-4703-b188-e95359be065e.webp', 0, '2022-06-06 19:37:46', '2022-06-06 19:37:46');
INSERT INTO `photos` VALUES ('1533775157439520770', '1533775128150695938', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/82656d7ce8f448668e802fb505677299640.webp', 0, '2022-06-06 19:37:48', '2022-06-06 19:37:48');
INSERT INTO `photos` VALUES ('1533775164720832513', '1533775128150695938', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/bacf139aad9541caab5f0e81b64aee236401.webp', 0, '2022-06-06 19:37:50', '2022-06-06 19:37:50');
INSERT INTO `photos` VALUES ('1533775172186693633', '1533775128150695938', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/0143acac0b304881a88113f95337f89748901d10-bcad-484e-bb1a-fc5b67f2b791.webp', 0, '2022-06-06 19:37:52', '2022-06-06 19:37:52');
INSERT INTO `photos` VALUES ('1533775182315937793', '1533775128150695938', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/5e7f4c5a67944b5daedd93c986f9a6eb232129224438.webp', 0, '2022-06-06 19:37:54', '2022-06-06 19:37:54');
INSERT INTO `photos` VALUES ('1533775194718494722', '1533775128150695938', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/716175baa86047e498ece8d29a3ac1c4232129317987.webp', 0, '2022-06-06 19:37:57', '2022-06-06 19:37:57');
INSERT INTO `photos` VALUES ('1533775203639779330', '1533775128150695938', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/32a2529a152c432cbfb8c85341698827232129398226.webp', 0, '2022-06-06 19:37:59', '2022-06-06 19:37:59');
INSERT INTO `photos` VALUES ('1533775213999710210', '1533775128150695938', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/777d49e122e14dd79ca595ec5017be31e2381a93-7ba1-47ef-b99c-bb76f086e3ff.webp', 0, '2022-06-06 19:38:02', '2022-06-06 19:38:02');
INSERT INTO `photos` VALUES ('1533775416005779457', '1533775398192570369', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/1290fca5dbb94cc79bd6010de278abd2120eb84713d0c0a88cd8e398c416126f.webp', 0, '2022-06-06 19:38:50', '2022-06-06 19:38:50');
INSERT INTO `photos` VALUES ('1533775423933014017', '1533775398192570369', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/46104144bfa342d697e1480ccf0c4aef501d86385f254982aacc84d575181e40.webp', 0, '2022-06-06 19:38:52', '2022-06-06 19:38:52');
INSERT INTO `photos` VALUES ('1533775431205937153', '1533775398192570369', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/7588a7dc9e7f497bae21579accc017a811661508-181845-0.webp', 0, '2022-06-06 19:38:54', '2022-06-06 19:38:54');
INSERT INTO `photos` VALUES ('1533775439128977410', '1533775398192570369', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/132522651a184f8aa0ee0e5c47f96e0c181531152879.webp', 0, '2022-06-06 19:38:56', '2022-06-06 19:38:56');
INSERT INTO `photos` VALUES ('1533775448050262018', '1533775398192570369', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/416a946ee7a44aeb90a207672b837696181531488038.webp', 0, '2022-06-06 19:38:58', '2022-06-06 19:38:58');
INSERT INTO `photos` VALUES ('1533775455713255426', '1533775398192570369', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/0ac401a643674a53bb9c19b1eb3eca35R-C (4).webp', 0, '2022-06-06 19:38:59', '2022-06-06 19:38:59');
INSERT INTO `photos` VALUES ('1533775474184970242', '1533775398192570369', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/36ee808d643a428492813e3bf38ce387R-C.webp', 0, '2022-06-06 19:39:04', '2022-06-06 19:39:04');
INSERT INTO `photos` VALUES ('1533775679944941570', '1533775663847202817', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/fa175b2a789442ed88ff49b0060314e8231439207859.webp', 0, '2022-06-06 19:39:53', '2022-06-06 19:39:53');
INSERT INTO `photos` VALUES ('1533775687305945089', '1533775663847202817', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/e947876e77c2455e9a3ce7b0d7d5878bOIP-C.webp', 0, '2022-06-06 19:39:55', '2022-06-06 19:39:55');
INSERT INTO `photos` VALUES ('1533775694943772674', '1533775663847202817', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/a66fd2e9d84747819aa7360845a7604cR-C.webp', 0, '2022-06-06 19:39:57', '2022-06-06 19:39:57');
INSERT INTO `photos` VALUES ('1533775947872886785', '1533775926498713602', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/63848080d1674eefb2067a6ff32da972232148495139.webp', 0, '2022-06-06 19:40:57', '2022-06-06 19:40:57');
INSERT INTO `photos` VALUES ('1533775955590406145', '1533775926498713602', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/af7892db207b4af197d4e906a33d07b9R-C (1).webp', 0, '2022-06-06 19:40:59', '2022-06-06 19:40:59');
INSERT INTO `photos` VALUES ('1533775963798659073', '1533775926498713602', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/ce8333bce3da4769992dc6761ec779ecR-C.webp', 0, '2022-06-06 19:41:01', '2022-06-06 19:41:01');
INSERT INTO `photos` VALUES ('1533775972048855041', '1533775926498713602', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/6a5bed6a172b4cbba67f09940f814e27R-C1.webp', 0, '2022-06-06 19:41:03', '2022-06-06 19:41:03');
INSERT INTO `photos` VALUES ('1533776184649736193', '1533776168732352513', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/c5592abfe7434cb1b24a5ee8e3777784045b29a8-bda7-42d5-8d80-ce2a740ea1c9.webp', 0, '2022-06-06 19:41:53', '2022-06-06 19:41:53');
INSERT INTO `photos` VALUES ('1533776192006545410', '1533776168732352513', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/1594ae1c0de648079e1b47d1f9cf20ca181545007937.webp', 0, '2022-06-06 19:41:55', '2022-06-06 19:41:55');
INSERT INTO `photos` VALUES ('1533776200286101506', '1533776168732352513', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/32ac79ddad6e4082a87e45cc4d22aabcR-C.webp', 0, '2022-06-06 19:41:57', '2022-06-06 19:41:57');
INSERT INTO `photos` VALUES ('1533776208053952513', '1533776168732352513', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/2855d8f5688b4c2b99bf1898a0c7de80R-C1.webp', 0, '2022-06-06 19:41:59', '2022-06-06 19:41:59');
INSERT INTO `photos` VALUES ('1533777517758930946', '1533776335044894721', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/0c7ba0d5a4ef4ee9a877809fc1a12827181508135539.webp', 0, '2022-06-06 19:47:11', '2022-06-06 19:47:11');
INSERT INTO `photos` VALUES ('1533777524461428738', '1533776335044894721', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/4abd74b2e3e44aaf9dd64f65e169d950R-C (1).webp', 0, '2022-06-06 19:47:13', '2022-06-06 19:47:13');
INSERT INTO `photos` VALUES ('1533777532548046849', '1533776335044894721', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/4eb095ab34cf45b6a6c2f29ba19de459R-C (2).webp', 0, '2022-06-06 19:47:15', '2022-06-06 19:47:15');
INSERT INTO `photos` VALUES ('1533777540504641537', '1533776335044894721', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/76778ff22e5245a7bc963fa72603fbb3R-C (3).webp', 0, '2022-06-06 19:47:17', '2022-06-06 19:47:17');
INSERT INTO `photos` VALUES ('1533777548192800769', '1533776335044894721', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/276d40684f1e434cab4705acfe0a1c9cR-C.webp', 0, '2022-06-06 19:47:18', '2022-06-06 19:47:18');
INSERT INTO `photos` VALUES ('1535221231240957954', '1535221230934773762', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/8d59ffd6d2d6469a89113f46209afa76dog.jpg', 0, '2022-06-10 19:23:59', '2022-06-10 19:23:59');
INSERT INTO `photos` VALUES ('1535221231240957955', '1535221230934773762', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/ecbb06fdd91845628dc595d8a4d988bcdog.jpg', 0, '2022-06-10 19:23:59', '2022-06-10 19:23:59');
INSERT INTO `photos` VALUES ('1535221776643084291', '1535221776643084290', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/b0e7cd996b9d49429746d2080b41cb23dog.jpg', 0, '2022-06-10 19:26:09', '2022-06-10 19:26:09');
INSERT INTO `photos` VALUES ('1535230379332468738', '1535230379265359873', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/ebab65107fa44c33b0abbe7ca7ff4a2ddog.jpg', 0, '2022-06-10 20:00:20', '2022-06-10 20:00:20');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role_desc` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'ROLE_MANAGER', '超级管理员管理普通管理员');
INSERT INTO `role` VALUES (2, 'ROLE_HOTEL', '管理旅馆信息');
INSERT INTO `role` VALUES (3, 'ROLE_SCENIC', '管理景点信息');
INSERT INTO `role` VALUES (4, 'ROLE_DELICACY', '管理美食信息');
INSERT INTO `role` VALUES (5, 'ROLE_NOTICE', '管理公告信息');
INSERT INTO `role` VALUES (6, 'ROLE_ROUTE', '管理旅游路线信息');
INSERT INTO `role` VALUES (7, 'ROLE_NOTE', '管理游记信息');
INSERT INTO `role` VALUES (8, 'ROLE_FEEDBACK', '管理反馈信息');
INSERT INTO `role` VALUES (9, 'ROLE_TOURIST', '管理游客信息');
INSERT INTO `role` VALUES (10, 'ROLE_COMMENT', '管理评论信息');

-- ----------------------------
-- Table structure for route_detail
-- ----------------------------
DROP TABLE IF EXISTS `route_detail`;
CREATE TABLE `route_detail`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点id',
  `route_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路id',
  `site` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点名称',
  `sort` tinyint(0) NOT NULL,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点活动详情描述',
  `start_time` time(0) NOT NULL COMMENT '站点活动开始时间',
  `end_time` time(0) NOT NULL COMMENT '站点活动结束时间',
  `is_deleted` tinyint(0) NOT NULL COMMENT '逻辑删除',
  `create_time` datetime(0) NOT NULL COMMENT '添加时间',
  `modify_time` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of route_detail
-- ----------------------------
INSERT INTO `route_detail` VALUES ('1533779030766018562', '1533777962288046082', '固城湖水慢城', 2, '\n11:30 到达湖边人家餐厅用餐\n\n12:30 抵达水慢城、集合拍照\n\n13:00-15:00 游览水慢城美景：湿地动物园科普、芦苇荡、戏渔谷、百荷园等\n\n17:30 集合出园，快乐返程', '10:00:00', '17:30:17', 0, '2022-06-06 19:53:12', '2022-06-06 19:53:12');
INSERT INTO `route_detail` VALUES ('1533779319267024898', '1533777962288046082', '高淳老街', 1, '早上集合快乐出发\n\n上午到达高淳老街，集合拍照。游览老街。', '07:29:13', '09:53:13', 0, '2022-06-06 19:54:21', '2022-06-06 19:54:21');
INSERT INTO `route_detail` VALUES ('1533779923695591425', '1533779534397071361', '南京游子山休闲旅游区', 1, '7：00 集合快乐出发\n\n9：00 到达游子山休闲旅游区，真如禅寺或者祈福园（二选一）。开启祈福之旅。\n\n午餐： 游子山真武庙素斋自助餐/国际慢城大山村农家乐\n', '07:00:00', '12:43:35', 0, '2022-06-06 19:56:45', '2022-06-06 19:56:45');
INSERT INTO `route_detail` VALUES ('1533780092260474881', '1533779534397071361', '桠溪国际慢城', 2, '13：30 到达高淳国际慢城游客中心，换乘景交车游览景区。景交车路线途经慢乐园，可以在此下车体验树冠漫步项目。\n\n14：30 游玩结束，继续乘坐观光车文化林广场下车，步行前往金花地，观赏金花花海、二月兰等景区风光。在桃花扇广场或者慢城大草坪拍照留念。\n\n15：30 前往大山村，欣赏最美乡村风光，品味慢城慢生活。\n\n16：00 乘坐观光车返回。\n\n16：00 集合，快乐返程', '13:30:45', '16:01:45', 0, '2022-06-06 19:57:25', '2022-06-06 19:57:25');
INSERT INTO `route_detail` VALUES ('1533780811868823554', '1533780619463516162', '固城湖水慢城', 1, '09:00-11:30：游览【固城湖水慢城】\n\n11:30-12:30：螃蟹宴【湖边人家】\n\n13:00-14:30：参观【固城湖螃蟹养殖基地】', '09:00:02', '14:31:06', 0, '2022-06-06 20:00:16', '2022-06-06 20:00:16');
INSERT INTO `route_detail` VALUES ('1533780935118446594', '1533780619463516162', '高淳老街', 2, '14:30-16:30：游览【高淳老街】', '14:35:17', '16:32:17', 0, '2022-06-06 20:00:46', '2022-06-06 20:00:46');
INSERT INTO `route_detail` VALUES ('1533781307811717122', '1533781160843304961', '固城湖水慢城', 1, '上午：固城湖水慢城集合签到，领取任务卡、建立小分队。动物互动课堂，观察几组动物的形态结构，了解动物生活习性，并按动物的主要特征作简单归类。\n\n中午：开启美食之旅\n\n下午：互动游戏：地球的历史、参观动物厨房。由专业饲养员介绍动物食物，了解动物园对饲料的选择、保存和加工及其科学原理。\n\n结营：分享与总结；永恒的瞬间让研学之旅画上圆满句号。', '09:02:01', '16:02:09', 0, '2022-06-06 20:02:15', '2022-06-06 20:02:15');
INSERT INTO `route_detail` VALUES ('1533781742832345090', '1533781557964201986', '桠溪国际慢城', 1, '7:00 集合快乐出发\n\n9:00 到达高淳国际慢城游客中心，换乘景交车游览景区。景交路线途经慢乐园，可以在此下车体验树冠漫步项目。\n\n10:00 游玩结束，继续乘坐观光车文化林广场下车，步行前往金花地，观赏金花花海、二月兰等景区风光。在桃花扇广场或者慢城大草坪拍照留念。\n\n11:30 前往大山村，欣赏最美乡村风光，品味慢城慢生活，享受享用地道的农家风味。\n\n13:30 乘坐观光车返回。\n\n14:30 出发前往游子山三条垄，观赏万亩茶园风光。\n\n16:00 集合，快乐返程', '07:01:43', '16:03:49', 0, '2022-06-06 20:03:58', '2022-06-06 20:03:58');

-- ----------------------------
-- Table structure for scenic_spot
-- ----------------------------
DROP TABLE IF EXISTS `scenic_spot`;
CREATE TABLE `scenic_spot`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '景点id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '景点名称',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '景点介绍',
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '景点图片',
  `popular` tinyint(0) NOT NULL COMMENT '展示优先级',
  `is_deleted` tinyint(0) NOT NULL COMMENT '逻辑删除',
  `create_time` datetime(0) NOT NULL COMMENT '添加时间',
  `modify_time` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scenic_spot
-- ----------------------------
INSERT INTO `scenic_spot` VALUES ('1533769427068149762', '保圣寺塔', '保圣寺塔相传建于东吴赤乌二年（239年），位于高淳区城东郊，是至今我省保存历史最久的两座方塔（另一座为常熟崇教寺方塔）之一，是江苏省级文物保护单位，也是古城高淳的一个标志性建筑。该塔造型为四方七级，砖木结构楼阁式，总高33.5米。人们入园站在塔下仰望塔身，只见飞檐蔽日，翘角凌云，塔刹挺拔，直冲九霄。各层翼角所悬铜铃，铃声如环击佩鸣，声声入耳，令人心驰神往。据说佛塔风铃因人施鸣，迷者闻之百感交集，行恶即止；智者听之朝善而行，倍加珍惜时光，顺梯登临顶室，朝窗举目四望，淳溪古镇公路纵横密如蛛网，市区幢幢高楼耸立，一派欣欣向荣的景象。南固城、北石臼，波光粼粼，湖边花山、游山姿容秀丽，东面田野风光也历历在目。登高观景，倍觉心胸开朗，意境无涯。', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/789a0c85ecf94fefa79aad5ab9912f6f231839487604.webp', 3, 0, '2022-06-06 19:15:02', '2022-06-06 19:15:02');
INSERT INTO `scenic_spot` VALUES ('1533769969991442433', '高淳博物馆', '高淳博物馆建筑面积5500㎡，馆藏文物30000余件，其中重要文物2000余件。博物馆基本陈列以“水绿山青，风高民淳”为主题，展示高淳的历史人文生态。分为“原始聚落•上古城邑”、“水工兴利•圩田稼穑”、“天地人神•精神世界”、“流民播迁•族群社居”、“口传心声•文化语境”、“地产风物•人文遗珍”六个单元。展览内容有：一万多年前的动植物化石；距今6300多年前的新石器时代“薛城遗址”的生活场景复原；伍子胥开挖世界上最古老人工运河之一——胥河的场景复原；以及比石头城早建208年的古固城场景复原和高淳老街的场景复原和3D显示；高淳道教神像画和重要非遗大马灯、跳五猖图像和光影显示；高淳作为江南水乡的历史治水壮举和现代两大支柱产业水运（含造船业）和螃蟹养殖的场景再现；被称为“古汉语活化石”的高淳方言以及高淳民风民俗的展览展示等进入高淳博物馆，你将在短时间内穿越高淳上万年历史,全面了解高淳历史文化和人文生态。', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/c6deb5688138407cb88a03e12054a0b0231421263089.webp', 3, 0, '2022-06-06 19:17:12', '2022-06-06 19:17:12');
INSERT INTO `scenic_spot` VALUES ('1533770426839228418', '高淳老街', '高淳老街是中国古街中的一颗灿烂的明珠。老街宋代已见雏形，明清两代依托官溪河的水运便利，因商立街，逐渐繁华。历经500多年的岁月更迭，至今存留了一条长800余米（最初为1135米），宽4米左右，核心区面积7.6公顷、片区面积1.2平方公里的古老街道，为江苏省目前保存最为完好的明清古街之一、国家AAAA级旅游景区、省级文物保护单位。2012年高淳老街成功入选“全国十大历史文化名街”。高淳老街展现了古老瑰丽的古建筑艺术及深厚的民间民俗文化。粉墙青瓦鳞次栉比，飞檐翘角突兀多姿，砖木石雕满目琳琅，雕梁画栋堂皇富丽，招牌书法多姿绚丽，山墙壁画浓郁芬香，被中外学者游客誉为“东方文明之缩影”、“古建筑的艺术宝库”、“中国民俗文化富矿区”。延续老街古朴肌理，新打造的曼度·老街东休闲街区集餐饮、客栈、酒吧、咖啡、文创精品等为一体，华灯初上，霓虹闪烁，为老街夜生活增添了一份独特的魅力。', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/01f4afc4be9e4605849c22f814d0a909231601255606.webp', 4, 0, '2022-06-06 19:19:01', '2022-06-06 19:19:01');
INSERT INTO `scenic_spot` VALUES ('1533770687578136577', '高淳陶瓷博物馆', '在陶瓷博物馆三栋建筑连体组成的1万平米展示空间里，设立了高淳陶瓷品牌瓷器展、中国历史名瓷展、中国当代国家用瓷、中国陶瓷艺术大师作品展四大专门展区。现代陶瓷生产工艺观览高淳陶瓷国家用瓷生产线建筑面积为3万平方米，是国家科技部十二五科技攻关项目--国家高品质陶瓷示范线，实现了国际标准的原料标准化、装备现代化、烧成气体化、辅料专业化、产品高档化，引领我国日用陶瓷技术发展。体验区占地120亩，展示手工拉坯、捏瓷、修坯、手工上釉、画瓷、柴窑烧成等传统陶瓷工艺制作全过程，游客体验手工拉坯、 捏瓷、修坯、上釉、画瓷等陶艺制作过程。陶艺苑新增沙漠寻宝活动，在沙漠中探寻，体验者可寻到古色古香的历史名瓷- -钧瓷，官窑瓷器-珐琅彩及出口国外的窑变釉炻器等高淳陶瓷特色产品。', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/d8960e62eebb45158ae93ae234329d5f181422207945.webp', 4, 0, '2022-06-06 19:20:03', '2022-06-06 19:20:03');
INSERT INTO `scenic_spot` VALUES ('1533771501742874626', '固城湖水慢城', '绿池落尽红蕖却\n\n荷叶犹开最小钱\n\n现代与中国风的碰撞\n\n在水慢城表现的淋漓尽致\n\n如今的荷花已经凋谢\n\n空气中弥漫着的\n\n都是荷叶的清香', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/5bc463afd0224032a75a43cf089ce001d8f28d28-8d35-47bc-b973-414be7cbcb6c.webp', 5, 0, '2022-06-06 19:23:17', '2022-06-06 19:23:17');
INSERT INTO `scenic_spot` VALUES ('1533772130812977154', '固城湾', '固城湾景区毗邻高淳老街\n\n与固城湖一堤之隔\n\n水岸的静态景观宜人心境\n\n陶冶性情\n\n让人感觉格外的宁静', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/46319d1f8f5d4cf0bd97602461867f18640 (4).webp', 4, 0, '2022-06-06 19:25:47', '2022-06-06 19:25:47');
INSERT INTO `scenic_spot` VALUES ('1533772378562125825', '荆山竹海', '古往今来竹子的形象和气韵\n\n受到了无数文人墨客的由衷赞美\n\n“未出土时先有节，及凌云处尚虚心”\n\n竹是高风亮节、虚怀若谷的象征', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/648b0a347b474927af6af7678ec4b15e640 (1).webp', 3, 0, '2022-06-06 19:26:46', '2022-06-06 19:26:46');
INSERT INTO `scenic_spot` VALUES ('1533772938916945922', '南京游子山休闲旅游区', '南京游子山休闲旅游区现为国家4A级旅游景区。景区内山明水秀，林木蓊郁，森林覆盖率高达86%，山势起伏，低丘逶迤，群峰列锦，碧水流韵，形成优美的自然景观。景区包括两大版块：游子山文化体验区以及拓展区三条垄片区。景区内动植物种类繁多，有高等植物1546种，野生动物257种，尤为珍贵的是杜蘅—中华虎凤蝶种群，这在整个华东乃至全国是绝无仅有的。这不仅表明景区生态环境极其优良，更因为高淳人民重视对自然生态的保护，才使这些濒危的动植物得到了不断繁衍。游子山休闲旅游区人文景观历史跨度大，从新石器时期一直延续到民国。史书记载，孔子曾到此游览并设坛讲学，游子山因此得名。现在，游子山脚下有3万孔氏家族，是全国除山东曲阜之外最大的孔氏居住地。游子山秀丽挺拔，因而又被誉为“濑渚第一形胜”，也是整个高淳的最高点。', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/42b687f63e0e464abf03a65d3f47ed08R-C.webp', 4, 0, '2022-06-06 19:28:59', '2022-06-06 19:28:59');
INSERT INTO `scenic_spot` VALUES ('1533773250046222337', '漆桥古村落', '微风岸，碧如簪\n\n黑瓦白墙，一纸红尘淡\n\n走进漆桥\n\n从建筑到陈设\n\n仿佛一副卷轴\n\n它们古朴自然\n\n让人仿佛走进了梦中的故园\n\n', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/b217be1f49ec412eaf90937050b3a691231406007812.webp', 3, 0, '2022-06-06 19:30:14', '2022-06-06 19:30:14');
INSERT INTO `scenic_spot` VALUES ('1533773542359851010', '武家嘴热带风情谷', '武家嘴热带风情谷位于高淳区的东坝街道，创建于2008年，核心面积6000亩。是一处集科技农业、农业科普、农事体验、生态观光、乡村度假、商务会议于一体的都市休闲农业综合体。曾先后获得全国五星级休闲农业景区、江苏省四星级乡村旅游区、江苏省青少年科普教育基地等殊荣。**园区内项目丰富多彩：2个各占地1.68万平方米的热带植物馆还原了最缤纷的热带植物园，玫瑰庄园形成了一片玫瑰花海。植物迷宫是目前省内最具挑战性的以植物为主题的迷宫；莲雾馆是南京首个莲雾种植的基地；农家豆腐坊古朴而庄重；青少年综合体验区是一处融合运动、游乐、拓展等训练为一体的儿童休闲游乐项目；10万平方米连栋智能温控蔬菜生产大棚内种植了品种多样的果蔬可供游客采摘。园区内的其他配套设施也是十分的完善，武家嘴热带风情谷为满足广大游客及商务人士的需求，在园区中修建了培训中心酒店和水景生态餐厅，可为游客提供住宿、餐饮、会议等服务项目。', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/cc93c77022be4da88d33b043816262ccR-C1.webp', 3, 0, '2022-06-06 19:31:23', '2022-06-06 19:31:23');
INSERT INTO `scenic_spot` VALUES ('1533774103033438209', '西舍“红色堡垒”', '西舍“红色堡垒”属于桠溪街道跃进村西舍自然村，村落形成于南宋时期，现为江苏省首批三星级康居乡村。村域面积280公顷，全村385户，1024人，是高淳地区最大的自然村。1943年新四军一支队16旅和苏南地委在此地重建溧高县抗日民主政府，成为溧高县委乃至苏南三地委活动的中心，革命先烈们在此地开辟建设高淳抗日游击根据地，抗击日伪军，开展减租减息、扩武招兵、剿匪反霸等工作，在苏南抗日战争史上留下了浓墨重彩的一笔。2016年6月被南京市委党史办命名为党史教育基地。2017年3月，西舍红色堡垒被纳入高淳区“一馆多基地”党性教育专线。**跃进村西舍“红色堡垒”教育基地现有溧高县委县政府、溧高县抗日民主政府大会堂、革命烈士纪念碑、溧高县国华初级中学、溧高县纺织厂等13处场馆，展览面积4000多平方米。溧高县抗日民主政府大会堂原址位于进村口，苏南三地委曾在这里召开过地委扩大会议，解放后用于张巡纪念馆，布展有抗战时期会议场景和图文介绍。', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/ed1f9e9378a14105891f9367211660af242053529798.webp', 3, 0, '2022-06-06 19:33:37', '2022-06-06 19:33:37');
INSERT INTO `scenic_spot` VALUES ('1533774303730884609', '薛城遗址', '薛城遗址位于淳溪街道，靠近石臼湖南岸，面积约6万平方米，1997年9月南京市博物馆与县文保所联合对遗址进行抢救性发掘，发掘面积100平方米。发掘出来的墓葬、居址及器具、谷物等，证明早在6000多年前，就有人类的祖先在此繁衍生息。它的发掘填补了长江中下游史前考古的空白，被评为“97年全国考古重要发现提名荣誉奖”，1997年12月，高淳县人民政府将遗址公布为县级文物保护单位。', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/a726d79b27ff4ffab17d06df01dd3b19231418158582.webp', 3, 0, '2022-06-06 19:34:25', '2022-06-06 19:34:25');
INSERT INTO `scenic_spot` VALUES ('1533774645596020737', '桠溪国际慢城', '桠溪国际慢城位于高淳区东北部，处于游子山国家森林公园东麓，是一处整合了丘陵生态资源而形成的集生态观光、农事体验、休闲度假为一体的慢生活休闲度假目的地。区域面积50平方公里， 全长48公里长的生态景观廊道，蜿蜒起伏盘旋于六个行政村之间，沿途点缀着独具风情的乡村旅游特色村：大山民俗村、吕家美食村、石墙围影视村、高村艺术家村、荆山长寿村；沿途贯穿着形态各异的体验产品：慢城博物馆、慢乐园、风情游船、华东最大四季花田、文峰塔。在这里每一种体验都能让您多角度全方位感受不一样的慢城，尽情享受诗意慢生活。区域面积50平方公里， 全长48公里长的生态景观廊道，蜿蜒起伏盘旋于六个行政村之间，沿途点缀着独具风情的乡村旅游特色村：大山民俗村、吕家美食村、石墙围影视村、高村艺术家村、荆山长寿村；沿途贯穿着形态各异的体验产品：慢城博物馆、慢乐园、风情游船、华东最大四季花田、文峰塔。在这里每一种体验都能让您多角度全方位感受不一样的慢城，尽情享受诗意慢生活。', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/34ed6209cd354fb88268e8cdf9485b46181459406692.webp', 5, 0, '2022-06-06 19:35:46', '2022-06-06 19:35:46');

-- ----------------------------
-- Table structure for tourist
-- ----------------------------
DROP TABLE IF EXISTS `tourist`;
CREATE TABLE `tourist`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nickName` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telephone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_deleted` tinyint(0) NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `modify_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tourist
-- ----------------------------
INSERT INTO `tourist` VALUES ('1534064312866316290', '青青草原扛把子', '12345678920', '$2a$10$zH4m4GppiITg1q2cEuXAu.QV7L/CWB/HvPRauGYt8DRWtcTNVTY8C', '123456@qq.com', 0, '2022-06-07 14:46:48', '2022-06-07 14:46:48');

-- ----------------------------
-- Table structure for tourist_route
-- ----------------------------
DROP TABLE IF EXISTS `tourist_route`;
CREATE TABLE `tourist_route`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路id',
  `title` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路标题',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路描述',
  `reason` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '推荐原因',
  `is_deleted` tinyint(0) NOT NULL COMMENT '逻辑删除',
  `create_time` datetime(0) NOT NULL COMMENT '添加时间',
  `modify_time` datetime(0) NOT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tourist_route
-- ----------------------------
INSERT INTO `tourist_route` VALUES ('1533777962288046082', '水慢城自然一日游', '【游览景点】固城湖水慢城—高淳老街', '生态自然·心态自然', 0, '2022-06-06 19:48:57', '2022-06-06 19:48:57');
INSERT INTO `tourist_route` VALUES ('1533779534397071361', '慢城祈福一日游', '【游览景点】游子山真如禅寺—高淳国际慢城', '祈福自然·生态慢城，赠送长寿碗筷', 0, '2022-06-06 19:55:12', '2022-06-06 19:55:12');
INSERT INTO `tourist_route` VALUES ('1533780619463516162', '经典品蟹之旅', '品尝原汁原味的螃蟹和蟹黄包', '固城湖螃蟹，拥有第一个国家级长江系中华绒螯蟹原种场、第一个国家级中华绒螯蟹标准化生产综合示范区、全国第一张有机蟹认证证书和“全国第一个螃蟹生态养殖标准”。固城湖品牌自 2001 年创建，2007 年被国家质检总局认定为国家地理标志保护产品，2009 年被国家工商总局认定为中国驰名商标。民国初年，北京四大名医之一的施今墨曾比喻固城湖螃蟹为螃蟹中一甲一名夺魁天下的状元。\n\n螃蟹宴，秋尽江南蟹正肥，螃蟹上桌百味淡。赴一场螃蟹之约，开启我们的味蕾奇遇。\n\n固城湖螃蟹养殖基地，生态养殖、科技养殖。观察了解螃蟹在干净的水中栖息、爬行、觅食、脱壳；吃的是小鱼、螺蛳、玉米、小麦；养殖技术与水产研究院农业大学合作检测无残留。参观之余也可现场选购优质大闸蟹。', 0, '2022-06-06 19:59:31', '2022-06-06 19:59:31');
INSERT INTO `tourist_route` VALUES ('1533781160843304961', '研学线路', '与动物的深入交流', '1、通过主题活动让学生形成对自然的好奇心及探索动物世界的兴趣，并具有一定的问题意识及解决问题的能力；\n\n2、能运用观察、调查等方法探索动物世界的奥秘；能与他人合作或独立进行基本的学习研究；\n\n3、认识并理解动物与人类的和谐关系；帮助形成正确的自然观、价值观。', 0, '2022-06-06 20:01:40', '2022-06-06 20:01:40');
INSERT INTO `tourist_route` VALUES ('1533781557964201986', '慢城+三条垄氧吧一日游', '【游览景点】高淳国际慢城—游子山休闲旅游区三条垄', '清新高淳·氧吧慢城。空气中带点甜！ 观中国最美茶园', 0, '2022-06-06 20:03:14', '2022-06-06 20:03:14');

-- ----------------------------
-- Table structure for travel_note
-- ----------------------------
DROP TABLE IF EXISTS `travel_note`;
CREATE TABLE `travel_note`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '游记id',
  `tourist_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '游客id',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '游记内容',
  `is_deleted` tinyint(0) NOT NULL COMMENT '逻辑删除',
  `create_time` datetime(0) NOT NULL COMMENT '添加时间',
  `modify_time` datetime(0) NOT NULL COMMENT '修改时间\r\n',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of travel_note
-- ----------------------------
INSERT INTO `travel_note` VALUES ('1535221230934773762', '1534064312866316290', '今天玩的很开心', 0, '2022-06-10 19:23:59', '2022-06-10 19:23:59');
INSERT INTO `travel_note` VALUES ('1535221776643084290', '1534064312866316290', '哇塞，这地方太美了', 0, '2022-06-10 19:26:09', '2022-06-10 19:26:09');

SET FOREIGN_KEY_CHECKS = 1;
