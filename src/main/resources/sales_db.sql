/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 80015
Source Host           : localhost:3306
Source Database       : sales_db

Target Server Type    : MYSQL
Target Server Version : 80015
File Encoding         : 65001

Date: 2019-11-27 15:39:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_customer
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(300) DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_customer
-- ----------------------------
INSERT INTO `t_customer` VALUES ('1', '福州新弯曲5号', '小李子', '福州艾玛超市', '2132-23213421', '');
INSERT INTO `t_customer` VALUES ('2', '天津兴达大街888号', '小张', '天津王大连锁酒店', '23432222311', '优质客户');
INSERT INTO `t_customer` VALUES ('3', '大凉山妥洛村', '小爱', '大凉山希望小学', '233243211', '照顾客户2');
INSERT INTO `t_customer` VALUES ('4', '南通通州新金路888号', '王二小', '南通通州综艺集团', '1832132321', '');

-- ----------------------------
-- Table structure for t_customer_return_list
-- ----------------------------
DROP TABLE IF EXISTS `t_customer_return_list`;
CREATE TABLE `t_customer_return_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount_paid` float NOT NULL,
  `amount_payable` float NOT NULL,
  `customer_return_date` datetime DEFAULT NULL,
  `customer_return_number` varchar(100) DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKd55ju83f0ntixagdvdrsmw10c` (`user_id`),
  KEY `FKl0ahdwa8slkocbfe57opembfx` (`customer_id`),
  CONSTRAINT `FKd55ju83f0ntixagdvdrsmw10c` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FKl0ahdwa8slkocbfe57opembfx` FOREIGN KEY (`customer_id`) REFERENCES `t_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_customer_return_list
-- ----------------------------
INSERT INTO `t_customer_return_list` VALUES ('2', '2200', '2200', '2017-10-27 00:00:00', 'XT201710270001', 'cc', '1', '1', '3');
INSERT INTO `t_customer_return_list` VALUES ('3', '4514', '4514', '2017-10-28 00:00:00', 'XT201710280001', 'cc', '1', '1', '3');
INSERT INTO `t_customer_return_list` VALUES ('4', '4400', '4400', '2017-10-30 00:00:00', 'XT201710300001', 'cc', '1', '1', '3');
INSERT INTO `t_customer_return_list` VALUES ('5', '139', '139', '2017-10-30 00:00:00', 'XT201710300002', 'cc', '1', '1', '2');
INSERT INTO `t_customer_return_list` VALUES ('6', '38', '38', '2017-11-03 00:00:00', 'XT201711030001', 'cc', '1', '1', '2');

-- ----------------------------
-- Table structure for t_customer_return_list_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_customer_return_list_goods`;
CREATE TABLE `t_customer_return_list_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `price` float NOT NULL,
  `total` float NOT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `customer_return_list_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKtqt67mbn96lxn8hvtl4piblhi` (`customer_return_list_id`),
  KEY `FK4sm5si4swbj3gae46jfk441yx` (`type_id`),
  CONSTRAINT `FK4sm5si4swbj3gae46jfk441yx` FOREIGN KEY (`type_id`) REFERENCES `t_goodstype` (`id`),
  CONSTRAINT `FKtqt67mbn96lxn8hvtl4piblhi` FOREIGN KEY (`customer_return_list_id`) REFERENCES `t_customer_return_list` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_customer_return_list_goods
-- ----------------------------
INSERT INTO `t_customer_return_list_goods` VALUES ('3', '0002', 'Note8', '华为荣耀Note8', '1', '2200', '2200', '台', '2', '16', '2');
INSERT INTO `t_customer_return_list_goods` VALUES ('4', '0002', 'Note8', '华为荣耀Note8', '2', '2200', '4400', '台', '3', '16', '2');
INSERT INTO `t_customer_return_list_goods` VALUES ('5', '0003', '500g装', '野生东北黑木耳', '3', '38', '114', '袋', '3', '11', '11');
INSERT INTO `t_customer_return_list_goods` VALUES ('6', '0002', 'Note8', '华为荣耀Note8', '2', '2200', '4400', '台', '4', '16', '2');
INSERT INTO `t_customer_return_list_goods` VALUES ('7', '0007', '500g装', '吉利人家牛肉味蛋糕', '2', '10', '20', '袋', '5', '11', '15');
INSERT INTO `t_customer_return_list_goods` VALUES ('8', '0009', '240g装', '休闲零食坚果特产精品干果无漂白大个开心果', '3', '33', '99', '袋', '5', '11', '17');
INSERT INTO `t_customer_return_list_goods` VALUES ('9', '0010', '250g装', '劲仔小鱼干', '1', '20', '20', '袋', '5', '11', '18');
INSERT INTO `t_customer_return_list_goods` VALUES ('10', '0003', '500g装', '野生东北黑木耳', '1', '38', '38', '袋', '6', '11', '11');

-- ----------------------------
-- Table structure for t_damage_list
-- ----------------------------
DROP TABLE IF EXISTS `t_damage_list`;
CREATE TABLE `t_damage_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `damage_date` datetime DEFAULT NULL,
  `damage_number` varchar(100) DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpn094ma69sch1icjc2gu7xus` (`user_id`),
  CONSTRAINT `FKpn094ma69sch1icjc2gu7xus` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_damage_list
-- ----------------------------
INSERT INTO `t_damage_list` VALUES ('3', '2017-10-27 00:00:00', 'BS201710270001', 'cc', '1');
INSERT INTO `t_damage_list` VALUES ('4', '2017-10-27 00:00:00', 'BS201710270002', 'cc', '1');
INSERT INTO `t_damage_list` VALUES ('5', '2017-11-03 00:00:00', 'BS201711030001', '', '1');

-- ----------------------------
-- Table structure for t_damage_list_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_damage_list_goods`;
CREATE TABLE `t_damage_list_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `price` float NOT NULL,
  `total` float NOT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `damage_list_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbf5m8mm3gctrnuubr9xkjamj8` (`damage_list_id`),
  KEY `FKdbdfmp09hlf2raktincwroe9n` (`type_id`),
  CONSTRAINT `FKbf5m8mm3gctrnuubr9xkjamj8` FOREIGN KEY (`damage_list_id`) REFERENCES `t_damage_list` (`id`),
  CONSTRAINT `FKdbdfmp09hlf2raktincwroe9n` FOREIGN KEY (`type_id`) REFERENCES `t_goodstype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_damage_list_goods
-- ----------------------------
INSERT INTO `t_damage_list_goods` VALUES ('4', '0003', '500g装', '野生东北黑木耳', '2', '23', '46', '袋', '3', '11', '11');
INSERT INTO `t_damage_list_goods` VALUES ('5', '0006', '300g装', '冰糖金桔干', '2', '5', '10', '盒', '3', '11', '14');
INSERT INTO `t_damage_list_goods` VALUES ('6', '0003', '500g装', '野生东北黑木耳', '2', '23', '46', '袋', '4', '11', '11');
INSERT INTO `t_damage_list_goods` VALUES ('7', '0005', '散装500克', '麦片燕麦巧克力', '32', '8', '256', '袋', '4', '11', '13');
INSERT INTO `t_damage_list_goods` VALUES ('8', '0007', '500g装', '吉利人家牛肉味蛋糕', '2', '4.5', '9', '袋', '4', '11', '15');
INSERT INTO `t_damage_list_goods` VALUES ('9', '0002', 'Note8', '华为荣耀Note8', '1', '2220', '2220', '台', '5', '16', '2');

-- ----------------------------
-- Table structure for t_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE `t_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `inventory_quantity` int(11) NOT NULL,
  `min_num` int(11) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `producer` varchar(200) DEFAULT NULL,
  `purchasing_price` float NOT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `selling_price` float NOT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `state` int(11) NOT NULL,
  `last_purchasing_price` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlxnna5ngumghp4f279mmbjtyo` (`type_id`),
  CONSTRAINT `FKlxnna5ngumghp4f279mmbjtyo` FOREIGN KEY (`type_id`) REFERENCES `t_goodstype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods
-- ----------------------------
INSERT INTO `t_goods` VALUES ('1', '0001', '175', '1000', '红色装', '陶华碧老干妈香辣脆油辣椒', '贵州省贵阳南明老干妈风味食品有限公司', '6.32', '好卖', '8.5', '瓶', '10', '2', '8.5');
INSERT INTO `t_goods` VALUES ('2', '0002', '142', '400', 'Note8', '华为荣耀Note8', '华为计算机系统有限公司', '1950.05', '热销', '2200', '台', '16', '2', '2220');
INSERT INTO `t_goods` VALUES ('11', '0003', '2897', '400', '500g装', '野生东北黑木耳', '辉南县博康土特产有限公司', '23', '够黑2', '38', '袋', '11', '2', '23');
INSERT INTO `t_goods` VALUES ('12', '0004', '326', '300', '2斤装', '新疆红枣', '沧州铭鑫食品有限公司', '13', '好吃', '25', '袋', '10', '2', '13');
INSERT INTO `t_goods` VALUES ('13', '0005', '53', '1000', '散装500克', '麦片燕麦巧克力', '福建省麦德好食品工业有限公司', '8', 'Goods', '15', '袋', '11', '2', '8');
INSERT INTO `t_goods` VALUES ('14', '0006', '36', '1999', '300g装', '冰糖金桔干', '揭西县同心食品有限公司', '5.1', '', '13', '盒', '11', '2', '5');
INSERT INTO `t_goods` VALUES ('15', '0007', '100651', '400', '500g装', '吉利人家牛肉味蛋糕', '合肥吉利人家食品有限公司', '4.5', 'good', '10', '袋', '11', '2', '4.5');
INSERT INTO `t_goods` VALUES ('16', '0008', '196', '500', '128g装', '奕森奶油桃肉蜜饯果脯果干桃肉干休闲零食品', '潮州市潮安区正大食品有限公司', '3', '', '10', '盒', '11', '2', '3');
INSERT INTO `t_goods` VALUES ('17', '0009', '365', '1000', '240g装', '休闲零食坚果特产精品干果无漂白大个开心果', '石家庄博群食品有限公司', '20', '', '33', '袋', '11', '2', '20');
INSERT INTO `t_goods` VALUES ('18', '0010', '10', '300', '250g装', '劲仔小鱼干', '湖南省华文食品有限公司', '12', '', '20', '袋', '11', '2', '12');
INSERT INTO `t_goods` VALUES ('19', '0011', '11', '300', '198g装', '山楂条', '临朐县七贤升利食品厂', '3.2', '', '10', '袋', '11', '0', '3.2');
INSERT INTO `t_goods` VALUES ('20', '0012', '22', '200', '500g装', '大乌梅干', '长春市鼎丰真食品有限责任公司', '20', '', '25', '袋', '11', '0', '20');
INSERT INTO `t_goods` VALUES ('21', '0013', '400', '100', '250g装', '手工制作芝麻香酥麻通', '桂林兰雨食品有限公司', '3', '', '8', '袋', '11', '2', '3');
INSERT INTO `t_goods` VALUES ('22', '0014', '12', '200', '250g装', '美国青豆原味 蒜香', '菲律宾', '5', '', '8', '袋', '11', '2', '5');
INSERT INTO `t_goods` VALUES ('24', '0015', '-3', '100', 'X', ' iPhone X', 'xx2', '8000', 'xxx2', '9500', '台', '16', '2', '8000');
INSERT INTO `t_goods` VALUES ('25', '0016', '0', '12', 'X', '21', '32', '100', '21', '120', '盒', '3', '0', '100');
INSERT INTO `t_goods` VALUES ('26', '0017', '-1', '100', 'ILCE-A6000L', 'Sony/索尼 ILCE-A6000L WIFI微单数码相机高清单电', 'xxx', '3000', 'xxx', '3650', '台', '15', '2', '3000');
INSERT INTO `t_goods` VALUES ('27', '0018', '-1', '400', 'IXUS 285 HS', 'Canon/佳能 IXUS 285 HS 数码相机 2020万像素高清拍摄', 'xx', '800', 'xxx', '1299', '台', '15', '2', '800');
INSERT INTO `t_goods` VALUES ('28', '0019', '0', '300', 'Q8', 'Golden Field/金河田 Q8电脑音响台式多媒体家用音箱低音炮重低音', 'xxxx', '60', '', '129', '台', '17', '0', '60');
INSERT INTO `t_goods` VALUES ('29', '0020', '0', '50', '190WDPT', 'Haier/海尔冰箱BCD-190WDPT双门电冰箱大两门冷藏冷冻', 'cc', '1000', '', '1699', '台', '14', '0', '1000');
INSERT INTO `t_goods` VALUES ('30', '0021', '0', '320', '4A ', 'Xiaomi/小米 小米电视4A 32英寸 智能液晶平板电视机', 'cc', '700', '', '1199', '台', '12', '0', '700');
INSERT INTO `t_goods` VALUES ('31', '0022', '0', '40', 'XQB55-36SP', 'TCL XQB55-36SP 5.5公斤全自动波轮迷你小型洗衣机家用单脱抗菌', 'cc', '400', '', '729', '台', '13', '0', '400');
INSERT INTO `t_goods` VALUES ('32', '0023', '0', '1000', '80g*2', '台湾进口膨化零食品张君雅小妹妹日式串烧丸子80g*2', 'cc', '4', '', '15', '袋', '9', '0', '4');
INSERT INTO `t_goods` VALUES ('33', '0024', '0', '10', 'A字裙', '卓图女装立领针织格子印花拼接高腰A字裙2017秋冬新款碎花连衣裙', 'cc', '168', '', '298', '件', '6', '0', '168');
INSERT INTO `t_goods` VALUES ('34', '0025', '0', '10', '三件套秋', '西服套装男三件套秋季新款商务修身职业正装男士西装新郎结婚礼服', 'cc', '189', '', '299', '件', '7', '0', '189');
INSERT INTO `t_goods` VALUES ('35', '0026', '0', '10', 'AFS JEEP', '加绒加厚正品AFS JEEP/战地吉普男大码长裤植绒保暖男士牛仔裤子', 'c', '60', '', '89', '条', '8', '0', '60');

-- ----------------------------
-- Table structure for t_goodstype
-- ----------------------------
DROP TABLE IF EXISTS `t_goodstype`;
CREATE TABLE `t_goodstype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `p_id` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goodstype
-- ----------------------------
INSERT INTO `t_goodstype` VALUES ('1', '所有类别', '-1', '1', 'icon-folderOpen');
INSERT INTO `t_goodstype` VALUES ('2', '服饰', '1', '1', 'icon-folder');
INSERT INTO `t_goodstype` VALUES ('3', '食品', '1', '1', 'icon-folder');
INSERT INTO `t_goodstype` VALUES ('4', '家电', '1', '1', 'icon-folder');
INSERT INTO `t_goodstype` VALUES ('5', '数码', '1', '1', 'icon-folder');
INSERT INTO `t_goodstype` VALUES ('6', '连衣裙', '2', '0', 'icon-folder');
INSERT INTO `t_goodstype` VALUES ('7', '男士西装', '2', '0', 'icon-folder');
INSERT INTO `t_goodstype` VALUES ('8', '牛仔裤', '2', '0', 'icon-folder');
INSERT INTO `t_goodstype` VALUES ('9', '进口食品', '3', '0', 'icon-folder');
INSERT INTO `t_goodstype` VALUES ('10', '地方特产', '3', '0', 'icon-folder');
INSERT INTO `t_goodstype` VALUES ('11', '休闲食品', '3', '0', 'icon-folder');
INSERT INTO `t_goodstype` VALUES ('12', '电视机', '4', '0', 'icon-folder');
INSERT INTO `t_goodstype` VALUES ('13', '洗衣机', '4', '0', 'icon-folder');
INSERT INTO `t_goodstype` VALUES ('14', '冰箱', '4', '0', 'icon-folder');
INSERT INTO `t_goodstype` VALUES ('15', '相机', '5', '0', 'icon-folder');
INSERT INTO `t_goodstype` VALUES ('16', '手机', '5', '0', 'icon-folder');
INSERT INTO `t_goodstype` VALUES ('17', '音箱', '5', '0', 'icon-folder');

-- ----------------------------
-- Table structure for t_goodsunit
-- ----------------------------
DROP TABLE IF EXISTS `t_goodsunit`;
CREATE TABLE `t_goodsunit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goodsunit
-- ----------------------------
INSERT INTO `t_goodsunit` VALUES ('1', '个');
INSERT INTO `t_goodsunit` VALUES ('2', '袋');
INSERT INTO `t_goodsunit` VALUES ('3', '盒');
INSERT INTO `t_goodsunit` VALUES ('4', '箱');
INSERT INTO `t_goodsunit` VALUES ('5', '台');
INSERT INTO `t_goodsunit` VALUES ('6', '包');
INSERT INTO `t_goodsunit` VALUES ('11', '件');
INSERT INTO `t_goodsunit` VALUES ('12', '条');

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbvn5yabu3vqwvtjoh32i9r4ip` (`user_id`),
  CONSTRAINT `FKbvn5yabu3vqwvtjoh32i9r4ip` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2919 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_log
-- ----------------------------

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `icon` varchar(100) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `p_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsni20f28wjqrmpp44uawa2ky4` (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6051 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES ('1', 'menu-plugin', '系统菜单', '1', null, '-1');
INSERT INTO `t_menu` VALUES ('10', 'menu-1', '进货管理', '1', null, '1');
INSERT INTO `t_menu` VALUES ('20', 'menu-2', '销售管理', '1', null, '1');
INSERT INTO `t_menu` VALUES ('30', 'menu-3', '库存管理', '1', null, '1');
INSERT INTO `t_menu` VALUES ('40', 'menu-4', '统计报表', '1', null, '1');
INSERT INTO `t_menu` VALUES ('50', 'menu-5', '基础资料', '1', null, '1');
INSERT INTO `t_menu` VALUES ('60', 'menu-6', '系统管理', '1', null, '1');
INSERT INTO `t_menu` VALUES ('1010', 'menu-11', '进货入库', '0', '/purchase/purchase.html', '10');
INSERT INTO `t_menu` VALUES ('1020', 'menu-12', '退货出库', '0', '/purchase/return.html', '10');
INSERT INTO `t_menu` VALUES ('1030', 'menu-13', '进货单据查询', '0', '/purchase/purchaseSearch.html', '10');
INSERT INTO `t_menu` VALUES ('1040', 'menu-14', '退货单据查询', '0', '/purchase/returnSearch.html', '10');
INSERT INTO `t_menu` VALUES ('1050', 'menu-15', '当前库存查询', '0', '/common/stockSearch.html', '10');
INSERT INTO `t_menu` VALUES ('2010', 'menu-21', '销售出库', '0', '/sale/saleout.html', '20');
INSERT INTO `t_menu` VALUES ('2020', 'menu-22', '客户退货', '0', '/sale/salereturn.html', '20');
INSERT INTO `t_menu` VALUES ('2030', 'menu-23', '销售单据查询', '0', '/sale/saleSearch.html', '20');
INSERT INTO `t_menu` VALUES ('2040', 'menu-24', '客户退货查询', '0', '/sale/returnSearch.html', '20');
INSERT INTO `t_menu` VALUES ('2050', 'menu-25', '当前库存查询', '0', '/common/stockSearch.html', '20');
INSERT INTO `t_menu` VALUES ('3010', 'menu-31', '商品报损', '0', '/stock/damage.html', '30');
INSERT INTO `t_menu` VALUES ('3020', 'menu-32', '商品报溢', '0', '/stock/overflow.html', '30');
INSERT INTO `t_menu` VALUES ('3030', 'menu-33', '库存报警', '0', '/stock/alarm.html', '30');
INSERT INTO `t_menu` VALUES ('3040', 'menu-34', '报损报溢查询', '0', '/stock/damageOverflowSearch.html', '30');
INSERT INTO `t_menu` VALUES ('3050', 'menu-35', '当前库存查询', '0', '/common/stockSearch.html', '30');
INSERT INTO `t_menu` VALUES ('4010', 'menu-41', '供应商统计', '0', '/count/supplier.html', '40');
INSERT INTO `t_menu` VALUES ('4020', 'menu-42', '客户统计', '0', '/count/customer.html', '40');
INSERT INTO `t_menu` VALUES ('4030', 'menu-43', '商品采购统计', '0', '/count/purchase.html', '40');
INSERT INTO `t_menu` VALUES ('4040', 'menu-44', '商品销售统计', '0', '/count/sale.html', '40');
INSERT INTO `t_menu` VALUES ('4050', 'menu-45', '按日统计分析', '0', '/count/saleDay.html', '40');
INSERT INTO `t_menu` VALUES ('4060', 'menu-46', '按月统计分析', '0', '/count/saleMonth.html', '40');
INSERT INTO `t_menu` VALUES ('5010', 'menu-51', '供应商管理', '0', '/basicData/supplier.html', '50');
INSERT INTO `t_menu` VALUES ('5020', 'menu-52', '客户管理', '0', '/basicData/customer.html', '50');
INSERT INTO `t_menu` VALUES ('5030', 'menu-53', '商品管理', '0', '/basicData/goods.html', '50');
INSERT INTO `t_menu` VALUES ('5040', 'menu-54', '期初库存', '0', '/basicData/stock.html', '50');
INSERT INTO `t_menu` VALUES ('6010', 'menu-61', '角色管理', '0', '/power/role.html', '60');
INSERT INTO `t_menu` VALUES ('6020', 'menu-62', '用户管理', '0', '/power/user.html', '60');
INSERT INTO `t_menu` VALUES ('6030', 'menu-65', '系统日志', '0', '/power/log.html', '60');
INSERT INTO `t_menu` VALUES ('6040', 'menu-63', '修改密码', '0', null, '60');
INSERT INTO `t_menu` VALUES ('6050', 'menu-64', '安全退出', '0', null, '60');

-- ----------------------------
-- Table structure for t_overflow_list
-- ----------------------------
DROP TABLE IF EXISTS `t_overflow_list`;
CREATE TABLE `t_overflow_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `overflow_date` datetime DEFAULT NULL,
  `overflow_number` varchar(100) DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3bu8hj2xniqwbrtg6ls6b8ej2` (`user_id`),
  CONSTRAINT `FK3bu8hj2xniqwbrtg6ls6b8ej2` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_overflow_list
-- ----------------------------
INSERT INTO `t_overflow_list` VALUES ('3', '2017-10-27 00:00:00', 'BY201710270001', 'dd', '1');
INSERT INTO `t_overflow_list` VALUES ('4', '2017-10-27 00:00:00', 'BY201710270002', 'ccc', '1');

-- ----------------------------
-- Table structure for t_overflow_list_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_overflow_list_goods`;
CREATE TABLE `t_overflow_list_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `price` float NOT NULL,
  `total` float NOT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `overflow_list_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKd3s9761mgl456tn2xb0d164h7` (`overflow_list_id`),
  KEY `FK8t46iik5kpciki8fnqtiuq5q3` (`type_id`),
  CONSTRAINT `FK8t46iik5kpciki8fnqtiuq5q3` FOREIGN KEY (`type_id`) REFERENCES `t_goodstype` (`id`),
  CONSTRAINT `FKd3s9761mgl456tn2xb0d164h7` FOREIGN KEY (`overflow_list_id`) REFERENCES `t_overflow_list` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_overflow_list_goods
-- ----------------------------
INSERT INTO `t_overflow_list_goods` VALUES ('4', '0002', 'Note8', '华为荣耀Note8', '2', '2220', '4440', '台', '3', '16', '2');
INSERT INTO `t_overflow_list_goods` VALUES ('5', '0006', '300g装', '冰糖金桔干', '3', '5', '15', '盒', '3', '11', '14');
INSERT INTO `t_overflow_list_goods` VALUES ('6', '0004', '2斤装', '新疆红枣', '2', '13', '26', '袋', '4', '10', '12');
INSERT INTO `t_overflow_list_goods` VALUES ('7', '0006', '300g装', '冰糖金桔干', '3', '5', '15', '盒', '4', '11', '14');

-- ----------------------------
-- Table structure for t_purchase_list
-- ----------------------------
DROP TABLE IF EXISTS `t_purchase_list`;
CREATE TABLE `t_purchase_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount_paid` float NOT NULL,
  `amount_payable` float NOT NULL,
  `purchase_date` datetime DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `state` int(11) NOT NULL,
  `purchase_number` varchar(100) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5j2dev8b2b5d0l69nb8vtr4yb` (`supplier_id`),
  KEY `FK69s6eyxr4wwvsywe9hbthef1h` (`user_id`),
  CONSTRAINT `FK5j2dev8b2b5d0l69nb8vtr4yb` FOREIGN KEY (`supplier_id`) REFERENCES `t_supplier` (`id`),
  CONSTRAINT `FK69s6eyxr4wwvsywe9hbthef1h` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_purchase_list
-- ----------------------------
INSERT INTO `t_purchase_list` VALUES ('25', '73299', '73299', '2017-10-27 00:00:00', 'cc', '1', 'JH201710270001', '2', '1');
INSERT INTO `t_purchase_list` VALUES ('26', '69099', '69099', '2017-10-28 00:00:00', 'cc', '1', 'JH201710280001', '2', '1');
INSERT INTO `t_purchase_list` VALUES ('28', '17', '17', '2017-10-31 00:00:00', 'cc', '1', 'JH201710310001', '5', '1');
INSERT INTO `t_purchase_list` VALUES ('29', '463', '463', '2017-11-03 00:00:00', 'cc', '1', 'JH201711030001', '1', '1');
INSERT INTO `t_purchase_list` VALUES ('30', '1240', '1240', '2017-11-03 00:00:00', 'cc', '1', 'JH201711030002', '1', '1');
INSERT INTO `t_purchase_list` VALUES ('31', '450', '450', '2017-11-03 00:00:00', 'ccc', '1', 'JH201711030003', '2', '1');

-- ----------------------------
-- Table structure for t_purchase_list_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_purchase_list_goods`;
CREATE TABLE `t_purchase_list_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `price` float NOT NULL,
  `total` float NOT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `purchase_list_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKfvdvgcebqkkokyn0o00idqnpy` (`purchase_list_id`),
  KEY `FK83ikbi2x3epn49fwcco8jlfwu` (`type_id`),
  CONSTRAINT `FK83ikbi2x3epn49fwcco8jlfwu` FOREIGN KEY (`type_id`) REFERENCES `t_goodstype` (`id`),
  CONSTRAINT `FKfvdvgcebqkkokyn0o00idqnpy` FOREIGN KEY (`purchase_list_id`) REFERENCES `t_purchase_list` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_purchase_list_goods
-- ----------------------------
INSERT INTO `t_purchase_list_goods` VALUES ('35', '0002', 'Note8', '华为荣耀Note8', '33', '2220', '73260', '台', '25', '16', '2');
INSERT INTO `t_purchase_list_goods` VALUES ('36', '0004', '2斤装', '新疆红枣', '3', '13', '39', '袋', '25', '10', '12');
INSERT INTO `t_purchase_list_goods` VALUES ('37', '0003', '500g装', '野生东北黑木耳', '3000', '23', '69000', '袋', '26', '11', '11');
INSERT INTO `t_purchase_list_goods` VALUES ('38', '0007', '500g装', '吉利人家牛肉味蛋糕', '22', '4.5', '99', '袋', '26', '11', '15');
INSERT INTO `t_purchase_list_goods` VALUES ('41', '0001', '红色装', '陶华碧老干妈香辣脆油辣椒', '2', '8.5', '17', '瓶', '28', '10', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('42', '0001', '红色装', '陶华碧老干妈香辣脆油辣椒', '4', '8.5', '34', '瓶', '29', '10', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('43', '0004', '2斤装', '新疆红枣', '33', '13', '429', '袋', '29', '10', '12');
INSERT INTO `t_purchase_list_goods` VALUES ('44', '0001', '红色装', '陶华碧老干妈香辣脆油辣椒', '100', '8.5', '850', '瓶', '30', '10', '1');
INSERT INTO `t_purchase_list_goods` VALUES ('45', '0004', '2斤装', '新疆红枣', '30', '13', '390', '袋', '30', '10', '12');
INSERT INTO `t_purchase_list_goods` VALUES ('46', '0015', 'X', ' iPhone X', '30', '0', '0', '台', '30', '16', '24');
INSERT INTO `t_purchase_list_goods` VALUES ('47', '0007', '500g装', '吉利人家牛肉味蛋糕', '100', '4.5', '450', '袋', '31', '11', '15');

-- ----------------------------
-- Table structure for t_return_list
-- ----------------------------
DROP TABLE IF EXISTS `t_return_list`;
CREATE TABLE `t_return_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount_paid` float NOT NULL,
  `amount_payable` float NOT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `return_date` datetime DEFAULT NULL,
  `return_number` varchar(100) DEFAULT NULL,
  `state` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4qxjj8bvj2etne243xluni0vn` (`supplier_id`),
  KEY `FK904juw2v1hm2av0ig26gae9jb` (`user_id`),
  CONSTRAINT `FK4qxjj8bvj2etne243xluni0vn` FOREIGN KEY (`supplier_id`) REFERENCES `t_supplier` (`id`),
  CONSTRAINT `FK904juw2v1hm2av0ig26gae9jb` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_return_list
-- ----------------------------
INSERT INTO `t_return_list` VALUES ('4', '4464', '4464', 'cc', '2017-10-27 00:00:00', 'TH201710270001', '1', '2', '1');
INSERT INTO `t_return_list` VALUES ('5', '4440', '4440', 'cc', '2017-11-03 00:00:00', 'TH201711030001', '1', '2', '1');

-- ----------------------------
-- Table structure for t_return_list_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_return_list_goods`;
CREATE TABLE `t_return_list_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `price` float NOT NULL,
  `total` float NOT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `return_list_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKemclu281vyvyk063c3foafq1w` (`return_list_id`),
  KEY `FKa1prpd96fcs0x2oe0omny9vio` (`type_id`),
  CONSTRAINT `FKa1prpd96fcs0x2oe0omny9vio` FOREIGN KEY (`type_id`) REFERENCES `t_goodstype` (`id`),
  CONSTRAINT `FKemclu281vyvyk063c3foafq1w` FOREIGN KEY (`return_list_id`) REFERENCES `t_return_list` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_return_list_goods
-- ----------------------------
INSERT INTO `t_return_list_goods` VALUES ('7', '0002', 'Note8', '华为荣耀Note8', '2', '2220', '4440', '台', '4', '16', '2');
INSERT INTO `t_return_list_goods` VALUES ('8', '0005', '散装500克', '麦片燕麦巧克力', '3', '8', '24', '袋', '4', '11', '13');
INSERT INTO `t_return_list_goods` VALUES ('9', '0002', 'Note8', '华为荣耀Note8', '2', '2220', '4440', '台', '5', '16', '2');
INSERT INTO `t_return_list_goods` VALUES ('10', '0015', 'X', ' iPhone X', '3', '0', '0', '台', '5', '16', '24');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bz` varchar(1000) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '系统管理员 最高权限', '管理员', null);
INSERT INTO `t_role` VALUES ('2', '主管', '主管', null);
INSERT INTO `t_role` VALUES ('4', '采购员', '采购员', null);
INSERT INTO `t_role` VALUES ('5', '销售经理', '销售经理', '22');
INSERT INTO `t_role` VALUES ('7', '仓库管理员', '仓库管理员', null);
INSERT INTO `t_role` VALUES ('9', '总经理', '总经理', null);

-- ----------------------------
-- Table structure for t_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsonb0rbt2u99hbrqqvv3r0wse` (`role_id`),
  KEY `FKhayg4ib6v7h1wyeyxhq6xlddq` (`menu_id`),
  CONSTRAINT `FKhayg4ib6v7h1wyeyxhq6xlddq` FOREIGN KEY (`menu_id`) REFERENCES `t_menu` (`id`),
  CONSTRAINT `FKsonb0rbt2u99hbrqqvv3r0wse` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`),
  CONSTRAINT `t_role_menu_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `t_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for t_sale_list
-- ----------------------------
DROP TABLE IF EXISTS `t_sale_list`;
CREATE TABLE `t_sale_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount_paid` float NOT NULL,
  `amount_payable` float NOT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `sale_date` datetime DEFAULT NULL,
  `sale_number` varchar(100) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK34bnujemrdqimbhg133enp8k8` (`user_id`),
  KEY `FKox4qfs87eu3fvwdmrvelqhi8e` (`customer_id`),
  CONSTRAINT `FK34bnujemrdqimbhg133enp8k8` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FKox4qfs87eu3fvwdmrvelqhi8e` FOREIGN KEY (`customer_id`) REFERENCES `t_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sale_list
-- ----------------------------
INSERT INTO `t_sale_list` VALUES ('4', '5060', '5060', 'cc', '2017-01-27 00:00:00', 'XS201701270001', '1', '1', '2');
INSERT INTO `t_sale_list` VALUES ('6', '4889', '4889', 'dd', '2017-02-28 00:00:00', 'XS201702280002', '1', '1', '2');
INSERT INTO `t_sale_list` VALUES ('7', '4400', '4400', 'cccc', '2017-03-30 00:00:00', 'XS201703300001', '1', '1', '2');
INSERT INTO `t_sale_list` VALUES ('8', '860', '860', 'cc', '2017-04-30 00:00:00', 'XS201704300002', '1', '1', '2');
INSERT INTO `t_sale_list` VALUES ('11', '83', '83', 'ccc', '2017-05-01 00:00:00', 'XS201705100003', '1', '1', '2');
INSERT INTO `t_sale_list` VALUES ('12', '6626', '6626', 'cccc', '2017-06-03 00:00:00', 'XS201706300001', '1', '1', '2');
INSERT INTO `t_sale_list` VALUES ('13', '76', '76', 'cc', '2017-06-03 00:00:00', 'XS201706300002', '1', '1', '1');
INSERT INTO `t_sale_list` VALUES ('14', '127', '127', 'cc', '2017-07-03 00:00:00', 'XS201707300003', '2', '1', '2');
INSERT INTO `t_sale_list` VALUES ('15', '1579.5', '1579.5', 'cc', '2017-08-03 00:00:00', 'XS201708300004', '1', '1', '2');
INSERT INTO `t_sale_list` VALUES ('16', '76', '76', 'cc', '2017-09-03 00:00:00', 'XS201709300005', '1', '1', '2');
INSERT INTO `t_sale_list` VALUES ('17', '111', '111', 'cc', '2017-10-28 00:00:00', 'XS201710280006', '1', '1', '2');
INSERT INTO `t_sale_list` VALUES ('18', '40', '40', 'cc', '2017-10-29 00:00:00', 'XS201710290007', '1', '1', '1');
INSERT INTO `t_sale_list` VALUES ('19', '45', '45', 'cc', '2017-10-30 00:00:00', 'XS201710300008', '1', '1', '1');
INSERT INTO `t_sale_list` VALUES ('20', '10', '10', 'cc', '2017-10-31 00:00:00', 'XS201710310009', '1', '1', '1');
INSERT INTO `t_sale_list` VALUES ('21', '202', '202', 'cc', '2017-11-01 00:00:00', 'XS201711010010', '1', '1', '2');
INSERT INTO `t_sale_list` VALUES ('22', '3650', '3650', '11', '2017-11-02 00:00:00', 'XS201711020011', '1', '1', '2');
INSERT INTO `t_sale_list` VALUES ('23', '20', '20', 'cc', '2017-11-03 00:00:00', 'XS201711030012', '1', '1', '1');
INSERT INTO `t_sale_list` VALUES ('24', '59', '59', 'cc', '2016-12-03 00:00:00', 'XS201712030013', '1', '1', '2');
INSERT INTO `t_sale_list` VALUES ('25', '146', '146', 'cc', '2016-11-03 00:00:00', 'XS201711030014', '1', '1', '1');

-- ----------------------------
-- Table structure for t_sale_list_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_sale_list_goods`;
CREATE TABLE `t_sale_list_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `price` float NOT NULL,
  `total` float NOT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `sale_list_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK20ehd6ta9geyql4hxtdsnhbox` (`sale_list_id`),
  KEY `FKn9i5p1d8f0gek5x7q45cq8ibw` (`type_id`),
  CONSTRAINT `FK20ehd6ta9geyql4hxtdsnhbox` FOREIGN KEY (`sale_list_id`) REFERENCES `t_sale_list` (`id`),
  CONSTRAINT `FKn9i5p1d8f0gek5x7q45cq8ibw` FOREIGN KEY (`type_id`) REFERENCES `t_goodstype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sale_list_goods
-- ----------------------------
INSERT INTO `t_sale_list_goods` VALUES ('7', '0002', 'Note8', '华为荣耀Note8', '2', '2200', '4400', '台', '4', '16', '2');
INSERT INTO `t_sale_list_goods` VALUES ('8', '0010', '250g装', '劲仔小鱼干', '33', '20', '660', '袋', '4', '11', '18');
INSERT INTO `t_sale_list_goods` VALUES ('11', '0003', '500g装', '野生东北黑木耳', '100', '38', '3800', '袋', '6', '11', '11');
INSERT INTO `t_sale_list_goods` VALUES ('12', '0009', '240g装', '休闲零食坚果特产精品干果无漂白大个开心果', '33', '33', '1089', '袋', '6', '11', '17');
INSERT INTO `t_sale_list_goods` VALUES ('13', '0002', 'Note8', '华为荣耀Note8', '2', '2200', '4400', '台', '7', '16', '2');
INSERT INTO `t_sale_list_goods` VALUES ('14', '0003', '500g装', '野生东北黑木耳', '22', '38', '836', '袋', '8', '11', '11');
INSERT INTO `t_sale_list_goods` VALUES ('15', '0014', '250g装', '美国青豆原味 蒜香', '3', '8', '24', '袋', '8', '11', '22');
INSERT INTO `t_sale_list_goods` VALUES ('20', '0003', '500g装', '野生东北黑木耳', '1', '38', '38', '袋', '11', '11', '11');
INSERT INTO `t_sale_list_goods` VALUES ('21', '0005', '散装500克', '麦片燕麦巧克力', '3', '15', '45', '袋', '11', '11', '13');
INSERT INTO `t_sale_list_goods` VALUES ('22', '0002', 'Note8', '华为荣耀Note8', '3', '2200', '6600', '台', '12', '16', '2');
INSERT INTO `t_sale_list_goods` VALUES ('23', '0006', '300g装', '冰糖金桔干', '2', '13', '26', '盒', '12', '11', '14');
INSERT INTO `t_sale_list_goods` VALUES ('24', '0003', '500g装', '野生东北黑木耳', '2', '38', '76', '袋', '13', '11', '11');
INSERT INTO `t_sale_list_goods` VALUES ('25', '0004', '2斤装', '新疆红枣', '3', '25', '75', '袋', '14', '10', '12');
INSERT INTO `t_sale_list_goods` VALUES ('26', '0006', '300g装', '冰糖金桔干', '4', '13', '52', '盒', '14', '11', '14');
INSERT INTO `t_sale_list_goods` VALUES ('27', '0001', '红色装', '陶华碧老干妈香辣脆油辣椒', '33', '8.5', '280.5', '瓶', '15', '10', '1');
INSERT INTO `t_sale_list_goods` VALUES ('28', '0018', 'IXUS 285 HS', 'Canon/佳能 IXUS 285 HS 数码相机 2020万像素高清拍摄', '1', '1299', '1299', '台', '15', '15', '27');
INSERT INTO `t_sale_list_goods` VALUES ('29', '0003', '500g装', '野生东北黑木耳', '2', '38', '76', '袋', '16', '11', '11');
INSERT INTO `t_sale_list_goods` VALUES ('30', '0005', '散装500克', '麦片燕麦巧克力', '3', '15', '45', '袋', '17', '11', '13');
INSERT INTO `t_sale_list_goods` VALUES ('31', '0009', '240g装', '休闲零食坚果特产精品干果无漂白大个开心果', '2', '33', '66', '袋', '17', '11', '17');
INSERT INTO `t_sale_list_goods` VALUES ('32', '0010', '250g装', '劲仔小鱼干', '1', '20', '20', '袋', '18', '11', '18');
INSERT INTO `t_sale_list_goods` VALUES ('33', '0008', '128g装', '奕森奶油桃肉蜜饯果脯果干桃肉干休闲零食品', '2', '10', '20', '盒', '18', '11', '16');
INSERT INTO `t_sale_list_goods` VALUES ('34', '0004', '2斤装', '新疆红枣', '1', '25', '25', '袋', '19', '10', '12');
INSERT INTO `t_sale_list_goods` VALUES ('35', '0008', '128g装', '奕森奶油桃肉蜜饯果脯果干桃肉干休闲零食品', '2', '10', '20', '盒', '19', '11', '16');
INSERT INTO `t_sale_list_goods` VALUES ('36', '0007', '500g装', '吉利人家牛肉味蛋糕', '1', '10', '10', '袋', '20', '11', '15');
INSERT INTO `t_sale_list_goods` VALUES ('37', '0003', '500g装', '野生东北黑木耳', '2', '38', '76', '袋', '21', '11', '11');
INSERT INTO `t_sale_list_goods` VALUES ('38', '0007', '500g装', '吉利人家牛肉味蛋糕', '2', '10', '20', '袋', '21', '11', '15');
INSERT INTO `t_sale_list_goods` VALUES ('39', '0009', '240g装', '休闲零食坚果特产精品干果无漂白大个开心果', '2', '33', '66', '袋', '21', '11', '17');
INSERT INTO `t_sale_list_goods` VALUES ('40', '0010', '250g装', '劲仔小鱼干', '2', '20', '40', '袋', '21', '11', '18');
INSERT INTO `t_sale_list_goods` VALUES ('41', '0017', 'ILCE-A6000L', 'Sony/索尼 ILCE-A6000L WIFI微单数码相机高清单电', '1', '3650', '3650', '台', '22', '15', '26');
INSERT INTO `t_sale_list_goods` VALUES ('42', '0010', '250g装', '劲仔小鱼干', '1', '20', '20', '袋', '23', '11', '18');
INSERT INTO `t_sale_list_goods` VALUES ('43', '0009', '240g装', '休闲零食坚果特产精品干果无漂白大个开心果', '1', '33', '33', '袋', '24', '11', '17');
INSERT INTO `t_sale_list_goods` VALUES ('44', '0006', '300g装', '冰糖金桔干', '2', '13', '26', '盒', '24', '11', '14');
INSERT INTO `t_sale_list_goods` VALUES ('45', '0009', '240g装', '休闲零食坚果特产精品干果无漂白大个开心果', '2', '33', '66', '袋', '25', '11', '17');
INSERT INTO `t_sale_list_goods` VALUES ('46', '0014', '250g装', '美国青豆原味 蒜香', '10', '8', '80', '袋', '25', '11', '22');

-- ----------------------------
-- Table structure for t_supplier
-- ----------------------------
DROP TABLE IF EXISTS `t_supplier`;
CREATE TABLE `t_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(300) DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_supplier
-- ----------------------------
INSERT INTO `t_supplier` VALUES ('1', '上海市金山区张堰镇松金公路2072号6607室', '小张', '上海福桂食品有限公司', '0773-7217175', '失信供应商');
INSERT INTO `t_supplier` VALUES ('2', '安徽省合肥市肥西县桃花工业园合派路', '小王', '安徽麦堡食品工业有限公司', '0773-7217275', null);
INSERT INTO `t_supplier` VALUES ('3', '晋江市罗山后林西区41号', '小李', '福建省晋江市罗山惠康食品有限公司', '1273-1217175', '优质供应商');
INSERT INTO `t_supplier` VALUES ('4', '南京市江宁区科学园竹山路565号1幢', '小丽', '南京含羞草食品有限公司', '2121-7217175', null);
INSERT INTO `t_supplier` VALUES ('5', '南京市高淳县阳江镇新桥村下桥278号', '王大狗', '南京禾乃美工贸有限公司', '2133-7217125', null);
INSERT INTO `t_supplier` VALUES ('6', '开平市水口镇东埠路６号', '小七', '开平广合腐乳有限公司', '3332-7217175', '2');
INSERT INTO `t_supplier` VALUES ('7', '汕头市跃进路２３号利鸿基中心大厦写字楼２座', '刘钩子', '汕头市金茂食品有限公司', '0723-7232175', null);
INSERT INTO `t_supplier` VALUES ('8', '南京市溧水区经济开发区', '七枷社', '南京喜之郎食品有限公司', '1773-7217175', null);
INSERT INTO `t_supplier` VALUES ('9', '深圳市罗湖区翠竹北路中深石化区厂房B栋6楼', '小蔡', '深圳昌信实业有限公司', '1773-7217175', null);
INSERT INTO `t_supplier` VALUES ('10', '南京市下关区金陵小区6村27-2-203室', '小路', '南京市下关区红鹰调味品商行', '2132-7217175', null);
INSERT INTO `t_supplier` VALUES ('11', '荔浦县荔塔路１６－３６号', '亲亲', '桂林阜康食品工业有限公司', '2123-7217175', null);
INSERT INTO `t_supplier` VALUES ('12', '南京鼓楼区世纪大楼123号', '小二', '南京大王科技', '0112-1426789', '123');
INSERT INTO `t_supplier` VALUES ('13', '南京将军路800号', '小吴', '南京大陆食品公司', '1243-2135487', 'cc');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bz` varchar(1000) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `true_name` varchar(50) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '管理员', '1', '王大陆', 'admin', null);
INSERT INTO `t_user` VALUES ('2', '主管', '123', '王大锤', 'jack', '2');
INSERT INTO `t_user` VALUES ('3', '销售经理', '123', '玛丽', 'marry', '33');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKa9c8iiy6ut0gnx491fqx4pxam` (`role_id`),
  KEY `FKq5un6x7ecoef5w1n39cop66kl` (`user_id`),
  CONSTRAINT `FKa9c8iiy6ut0gnx491fqx4pxam` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`),
  CONSTRAINT `FKq5un6x7ecoef5w1n39cop66kl` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('1', '1', '1');
INSERT INTO `t_user_role` VALUES ('19', '2', '2');
INSERT INTO `t_user_role` VALUES ('20', '4', '2');
INSERT INTO `t_user_role` VALUES ('21', '5', '2');
INSERT INTO `t_user_role` VALUES ('28', '2', '3');
INSERT INTO `t_user_role` VALUES ('29', '4', '3');
INSERT INTO `t_user_role` VALUES ('30', '5', '3');
INSERT INTO `t_user_role` VALUES ('31', '7', '3');
