/*
 Navicat MySQL Data Transfer

 Source Server         : clydeblog
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : localhost:3306
 Source Schema         : clydeblog_db

 Target Server Type    : MySQL
 Target Server Version : 80020
 File Encoding         : 65001

 Date: 02/06/2020 01:49:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for architecture_architect
-- ----------------------------
DROP TABLE IF EXISTS `architecture_architect`;
CREATE TABLE `architecture_architect`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int(0) NULL DEFAULT NULL,
  `profile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `architecture_archite_country_id_3d79c2ff_fk_architect`(`country_id`) USING BTREE,
  CONSTRAINT `architecture_archite_country_id_3d79c2ff_fk_architect` FOREIGN KEY (`country_id`) REFERENCES `architecture_country` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of architecture_architect
-- ----------------------------
INSERT INTO `architecture_architect` VALUES (1, '扎哈哈迪德', 2, 'architecture/img_architect/扎哈哈迪德.jpg');

-- ----------------------------
-- Table structure for architecture_architecture
-- ----------------------------
DROP TABLE IF EXISTS `architecture_architecture`;
CREATE TABLE `architecture_architecture`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `build_time` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_time` datetime(6) NOT NULL,
  `modified_time` datetime(6) NOT NULL,
  `architect_id` int(0) NULL DEFAULT NULL,
  `build_country_id` int(0) NULL DEFAULT NULL,
  `structure_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `architecture_archite_architect_id_397c3f56_fk_architect`(`architect_id`) USING BTREE,
  INDEX `architecture_archite_build_country_id_adf8457c_fk_architect`(`build_country_id`) USING BTREE,
  INDEX `architecture_archite_structure_id_eef3a872_fk_architect`(`structure_id`) USING BTREE,
  CONSTRAINT `architecture_archite_architect_id_397c3f56_fk_architect` FOREIGN KEY (`architect_id`) REFERENCES `architecture_architect` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `architecture_archite_build_country_id_adf8457c_fk_architect` FOREIGN KEY (`build_country_id`) REFERENCES `architecture_country` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `architecture_archite_structure_id_eef3a872_fk_architect` FOREIGN KEY (`structure_id`) REFERENCES `architecture_structure` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of architecture_architecture
-- ----------------------------
INSERT INTO `architecture_architecture` VALUES (1, '北京大兴国际机场', NULL, '2020-05-18 02:30:57.164000', '2020-05-18 02:33:03.175000', 1, 1, NULL);

-- ----------------------------
-- Table structure for architecture_country
-- ----------------------------
DROP TABLE IF EXISTS `architecture_country`;
CREATE TABLE `architecture_country`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of architecture_country
-- ----------------------------
INSERT INTO `architecture_country` VALUES (1, '中国');
INSERT INTO `architecture_country` VALUES (2, '日本');

-- ----------------------------
-- Table structure for architecture_structure
-- ----------------------------
DROP TABLE IF EXISTS `architecture_structure`;
CREATE TABLE `architecture_structure`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of architecture_structure
-- ----------------------------
INSERT INTO `architecture_structure` VALUES (1, '现代主义');

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
INSERT INTO `auth_group` VALUES (1, '管理员');

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `group_id` int(0) NOT NULL,
  `permission_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------
INSERT INTO `auth_group_permissions` VALUES (4, 1, 16);
INSERT INTO `auth_group_permissions` VALUES (5, 1, 25);
INSERT INTO `auth_group_permissions` VALUES (6, 1, 28);
INSERT INTO `auth_group_permissions` VALUES (7, 1, 29);
INSERT INTO `auth_group_permissions` VALUES (1, 1, 38);
INSERT INTO `auth_group_permissions` VALUES (2, 1, 39);
INSERT INTO `auth_group_permissions` VALUES (3, 1, 40);

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(0) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add category', 7, 'add_category');
INSERT INTO `auth_permission` VALUES (26, 'Can change category', 7, 'change_category');
INSERT INTO `auth_permission` VALUES (27, 'Can delete category', 7, 'delete_category');
INSERT INTO `auth_permission` VALUES (28, 'Can view category', 7, 'view_category');
INSERT INTO `auth_permission` VALUES (29, 'Can add tag', 8, 'add_tag');
INSERT INTO `auth_permission` VALUES (30, 'Can change tag', 8, 'change_tag');
INSERT INTO `auth_permission` VALUES (31, 'Can delete tag', 8, 'delete_tag');
INSERT INTO `auth_permission` VALUES (32, 'Can view tag', 8, 'view_tag');
INSERT INTO `auth_permission` VALUES (33, 'Can add post', 9, 'add_post');
INSERT INTO `auth_permission` VALUES (34, 'Can change post', 9, 'change_post');
INSERT INTO `auth_permission` VALUES (35, 'Can delete post', 9, 'delete_post');
INSERT INTO `auth_permission` VALUES (36, 'Can view post', 9, 'view_post');
INSERT INTO `auth_permission` VALUES (37, 'Can add article', 10, 'add_article');
INSERT INTO `auth_permission` VALUES (38, 'Can change article', 10, 'change_article');
INSERT INTO `auth_permission` VALUES (39, 'Can delete article', 10, 'delete_article');
INSERT INTO `auth_permission` VALUES (40, 'Can view article', 10, 'view_article');
INSERT INTO `auth_permission` VALUES (41, 'Can add architect', 11, 'add_architect');
INSERT INTO `auth_permission` VALUES (42, 'Can change architect', 11, 'change_architect');
INSERT INTO `auth_permission` VALUES (43, 'Can delete architect', 11, 'delete_architect');
INSERT INTO `auth_permission` VALUES (44, 'Can view architect', 11, 'view_architect');
INSERT INTO `auth_permission` VALUES (45, 'Can add country', 12, 'add_country');
INSERT INTO `auth_permission` VALUES (46, 'Can change country', 12, 'change_country');
INSERT INTO `auth_permission` VALUES (47, 'Can delete country', 12, 'delete_country');
INSERT INTO `auth_permission` VALUES (48, 'Can view country', 12, 'view_country');
INSERT INTO `auth_permission` VALUES (49, 'Can add structure', 13, 'add_structure');
INSERT INTO `auth_permission` VALUES (50, 'Can change structure', 13, 'change_structure');
INSERT INTO `auth_permission` VALUES (51, 'Can delete structure', 13, 'delete_structure');
INSERT INTO `auth_permission` VALUES (52, 'Can view structure', 13, 'view_structure');
INSERT INTO `auth_permission` VALUES (53, 'Can add architecture', 14, 'add_architecture');
INSERT INTO `auth_permission` VALUES (54, 'Can change architecture', 14, 'change_architecture');
INSERT INTO `auth_permission` VALUES (55, 'Can delete architecture', 14, 'delete_architecture');
INSERT INTO `auth_permission` VALUES (56, 'Can view architecture', 14, 'view_architecture');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$180000$wA7264vvK5gR$Uue+NmEAMiaIoDDJ74UiPLm8WVmAPJi8ynY8aPl8A0g=', '2020-05-31 05:54:18.754082', 1, 'clyde', '', '', '', 1, 1, '2020-05-06 15:38:00.000000');
INSERT INTO `auth_user` VALUES (2, 'pbkdf2_sha256$216000$hqXKkgd1GQ80$naQxO+PoKjVXY/Kbg//Gsp7TNc2LtgOa1BBl0uWb2Nc=', '2020-05-18 07:55:46.959000', 0, '神乎其技', '', '', '', 1, 1, '2020-05-18 07:54:00.000000');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `group_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------
INSERT INTO `auth_user_groups` VALUES (1, 2, 1);

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `permission_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for blog_article
-- ----------------------------
DROP TABLE IF EXISTS `blog_article`;
CREATE TABLE `blog_article`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `modified_time` datetime(6) NOT NULL,
  `author_id` int(0) NOT NULL,
  `category_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `blog_article_author_id_905add38_fk_auth_user_id`(`author_id`) USING BTREE,
  INDEX `blog_article_category_id_7e38f15e_fk_blog_category_id`(`category_id`) USING BTREE,
  CONSTRAINT `blog_article_author_id_905add38_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `blog_article_category_id_7e38f15e_fk_blog_category_id` FOREIGN KEY (`category_id`) REFERENCES `blog_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_article
-- ----------------------------
INSERT INTO `blog_article` VALUES (1, 'Grasshopper鱼鳞片表皮', '<div style=\"margin-left:0px; margin-right:0px\">import rhinoscriptsyntax as rs</div>\r\n\r\n<div style=\"margin-left:0px; margin-right:0px\">import Rhino.Geometry as rg</div>\r\n\r\n<div style=\"margin-left:0px; margin-right:0px\">以下的rs，rg等为导入的犀牛模块的简写。以下的代码都可以在官网的API查找</div>\r\n\r\n<div style=\"margin-left:0px; margin-right:0px\">网址：https://developer.rhino3d.com/api/</div>\r\n\r\n<div style=\"margin-left:0px; margin-right:0px\">&nbsp;</div>\r\n\r\n<div style=\"margin-left:0px; margin-right:0px\">&nbsp;</div>\r\n\r\n<div style=\"margin-left:0px; margin-right:0px\">\r\n<div style=\"margin-left:0px; margin-right:0px\">rs.AddPoint(0,0,0)</div>\r\n\r\n<div style=\"margin-left:0px; margin-right:0px\">添加一个点</div>\r\n\r\n<div style=\"margin-left:0px; margin-right:0px\">&nbsp;</div>\r\n\r\n<div style=\"margin-left:0px; margin-right:0px\">rs.MoveObject(物体, 点或者向量)</div>\r\n\r\n<div style=\"margin-left:0px; margin-right:0px\">将物体移动到点pt位置或者移动向量</div>\r\n\r\n<div style=\"margin-left:0px; margin-right:0px\">&nbsp;</div>\r\n\r\n<div style=\"margin-left:0px; margin-right:0px\">rs.AddCircle(点, 长度)</div>\r\n\r\n<div style=\"margin-left:0px; margin-right:0px\">根据圆心和半径生成圆</div>\r\n\r\n<div style=\"margin-left:0px; margin-right:0px\">&nbsp;</div>\r\n\r\n<div style=\"margin-left:0px; margin-right:0px\">rs.Distance(点,点)</div>\r\n\r\n<div style=\"margin-left:0px; margin-right:0px\">2点的距离。</div>\r\n\r\n<div style=\"margin-left:0px; margin-right:0px\">&nbsp;</div>\r\n\r\n<div style=\"margin-left:0px; margin-right:0px\">rs.AddLine(点, 点)</div>\r\n\r\n<div style=\"margin-left:0px; margin-right:0px\">根据2点创建直线。</div>\r\n\r\n<div style=\"margin-left:0px; margin-right:0px\">&nbsp;</div>\r\n\r\n<div style=\"margin-left:0px; margin-right:0px\">曲线.PointAt(数）</div>\r\n\r\n<div style=\"margin-left:0px; margin-right:0px\">根据曲线和距离曲线原点的长度来生成点</div>\r\n\r\n<div style=\"margin-left:0px; margin-right:0px\">&nbsp;</div>\r\n\r\n<div style=\"margin-left:0px; margin-right:0px\">rg.Intersect.Intersection.CurveCurve(曲线1，曲线2，数1，数2)</div>\r\n\r\n<div style=\"margin-left:0px; margin-right:0px\">求2条曲线的交点</div>\r\n\r\n<div style=\"margin-left:0px; margin-right:0px\">&nbsp;</div>\r\n\r\n<div style=\"margin-left:0px; margin-right:0px\">曲线.ClosestPoint(点)</div>\r\n\r\n<div style=\"margin-left:0px; margin-right:0px\">获得的是一个元组(布尔值，数值)。数值为点在曲线的t值</div>\r\n\r\n<div style=\"margin-left:0px; margin-right:0px\">&nbsp;</div>\r\n\r\n<div style=\"margin-left:0px; margin-right:0px\">rs.AddSrfPt([点, 点, 点])</div>\r\n\r\n<div style=\"margin-left:0px; margin-right:0px\">根据一个列表的点生成曲面</div>\r\n</div>', '2020-05-15 17:41:00.000000', '2020-06-01 16:27:50.279320', 1, 2);
INSERT INTO `blog_article` VALUES (2, 'Django学习笔记', '启动服务器\r\npython manage.py runserver\r\n \r\n同步数据库\r\npython manage.py makemigrations   制造\r\npython manage.py migrate  迁移\r\n \r\n创建管理员\r\npython manage.py createsuperuser\r\n \r\n创建应用 \r\npython manage.py startapp XXX\r\n \r\n注册应用（创建后需要注册才能使用）\r\n在根目录settings.py里面的INSTALLED_APPS添加应用名\r\n \r\n \r\n \r\nviews   存放请求方法。即不同网页回复请求\r\n创建一个文章请求方法\r\ndef article_detail(request,article_id):                     #request是必写。article_id是传入值。函数内部调用\r\n    article = Article.objects.get(id=article_id)\r\n    return HttpResponse(标题是%s\"%(article.title)\r\n \r\nviews或者模板引用模型实例的属性，如文章的标题\r\n先获取实例，方法是objects.get\r\narticle = Article.objects.get(id=article_id)\r\n然后就能article.title获得标题了\r\n获取所有实例，方法是objects,all()\r\n\r\n\r\n\r\n添加404报错\r\n    try:\r\n       article = Article.objects.get(id=article_id)\r\n    except Article.DoesNotExist:\r\n        raise Http404\r\n\r\n同时获得实例加添加404报错\r\narticle = get_object_or_404(Article,id=article_id)    #模型名，根据id来检索实例\r\n \r\n \r\n\r\n\r\n创建模板\r\n新建文件夹templates。创建article_detail.html\r\n \r\n在settings.py注册模板\r\n\'DIRS\': [os.path.join(BASE_DIR, \'templates\')]\r\n \r\n修改views\r\n用render\r\ndef article_detail(request,article_id):\r\n\r\n    article = Article.objects.get(id=article_id)\r\n    context = {}                               # 创建字典\r\n    context[\'article\']=article              #将文章实例放入字典\r\n\r\n    return render(request,\"article_detail.html\",context)   #request，模板文件位置，字典\r\n \r\n在模板引用  （views里面把模型实例导入字典后）\r\n{{article.title}} #引用标题\r\n \r\n \r\n \r\nmodels  存放模型 如创建一个文章模型。或者说类。\r\n创建一个文章模型\r\nclass Article(models.Model):\r\n    title = models.CharField(max_length=30)\r\n    content = models.TextField()\r\n \r\n将模型注册到后台\r\nadmin.site.register(Article)\r\n在admin.py里添加\r\n \r\n \r\n \r\n \r\n \r\n \r\nurls  网址和请求方法对应关系', '2020-05-16 02:17:00.000000', '2020-05-17 13:46:36.744000', 1, 2);
INSERT INTO `blog_article` VALUES (3, '66哈', '<p>哈哈哈哈哈</p>', '2020-05-18 10:02:12.209000', '2020-06-01 16:29:30.780832', 1, 3);
INSERT INTO `blog_article` VALUES (4, 'gdgdsg', 'afsdfsad', '2020-05-30 13:28:17.308000', '2020-05-30 13:28:17.308000', 1, 3);
INSERT INTO `blog_article` VALUES (5, '官方的', 'gagfsafsdf', '2020-05-30 13:28:35.748000', '2020-05-30 13:28:35.748000', 1, 3);
INSERT INTO `blog_article` VALUES (6, '35345t3tge', 'gggdsgdf', '2020-05-30 13:29:04.264000', '2020-05-30 13:29:04.264000', 1, 3);
INSERT INTO `blog_article` VALUES (7, '564yhrth', 'sfhdfhg', '2020-05-30 13:29:13.978000', '2020-05-30 13:29:13.978000', 1, 3);
INSERT INTO `blog_article` VALUES (8, '5643645', 'yrtyreyrt', '2020-05-30 13:29:30.967000', '2020-05-30 13:29:30.967000', 1, 3);
INSERT INTO `blog_article` VALUES (9, 'gtgfsfsa', 'fsdafsad', '2020-05-30 17:45:32.623000', '2020-05-30 17:45:32.623000', 1, 2);
INSERT INTO `blog_article` VALUES (10, '656436', 'sgfgdsfg', '2020-05-30 17:45:38.790000', '2020-05-30 17:45:38.790000', 1, 2);
INSERT INTO `blog_article` VALUES (11, '56456y43', 'sghdsgdsg', '2020-05-30 17:45:44.820000', '2020-05-30 17:45:44.820000', 1, 2);
INSERT INTO `blog_article` VALUES (12, '235435', 'tg53rtgew', '2020-05-30 18:01:52.493000', '2020-05-30 18:01:52.493000', 1, 2);

-- ----------------------------
-- Table structure for blog_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_article_tag`;
CREATE TABLE `blog_article_tag`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `article_id` int(0) NOT NULL,
  `tag_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `blog_article_tag_article_id_tag_id_818e752b_uniq`(`article_id`, `tag_id`) USING BTREE,
  INDEX `blog_article_tag_tag_id_f2afe66b_fk_blog_tag_id`(`tag_id`) USING BTREE,
  CONSTRAINT `blog_article_tag_article_id_8db2395e_fk_blog_article_id` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `blog_article_tag_tag_id_f2afe66b_fk_blog_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `blog_tag` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_article_tag
-- ----------------------------
INSERT INTO `blog_article_tag` VALUES (1, 1, 1);
INSERT INTO `blog_article_tag` VALUES (2, 2, 1);

-- ----------------------------
-- Table structure for blog_category
-- ----------------------------
DROP TABLE IF EXISTS `blog_category`;
CREATE TABLE `blog_category`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_category
-- ----------------------------
INSERT INTO `blog_category` VALUES (2, 'python', '学习python真好玩');
INSERT INTO `blog_category` VALUES (3, '建筑', '各种建筑资料');

-- ----------------------------
-- Table structure for blog_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_tag`;
CREATE TABLE `blog_tag`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_tag
-- ----------------------------
INSERT INTO `blog_tag` VALUES (1, 'tag test');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint(0) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(0) NULL DEFAULT NULL,
  `user_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2020-05-15 17:36:20.590000', '1', 'Category object (1)', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (2, '2020-05-15 17:36:37.145000', '2', 'Category object (2)', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (3, '2020-05-15 17:36:49.099000', '3', 'Category object (3)', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (4, '2020-05-15 17:41:54.958000', '1', 'Article object (1)', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (5, '2020-05-16 02:17:40.406000', '2', 'Article object (2)', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (6, '2020-05-16 08:05:00.974000', '2', '<Django学习笔记>', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (7, '2020-05-17 13:41:31.157000', '1', '管理员', 1, '[{\"added\": {}}]', 3, 1);
INSERT INTO `django_admin_log` VALUES (8, '2020-05-17 13:46:36.753000', '2', '<Django学习笔记>', 2, '[]', 10, 1);
INSERT INTO `django_admin_log` VALUES (9, '2020-05-18 02:18:14.291000', '1', 'Country object (1)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (10, '2020-05-18 02:19:46.278000', '1', '0', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (11, '2020-05-18 02:20:11.094000', '1', '0', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (12, '2020-05-18 02:30:57.166000', '1', 'Architecture object (1)', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (13, '2020-05-18 02:31:46.746000', '1', '扎哈哈迪德', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (14, '2020-05-18 02:31:59.152000', '2', '日本', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (15, '2020-05-18 02:32:05.502000', '1', '中国', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (16, '2020-05-18 02:32:19.215000', '1', '现代主义', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (17, '2020-05-18 02:32:47.254000', '1', '扎哈哈迪德', 2, '[{\"changed\": {\"fields\": [\"Country\"]}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (18, '2020-05-18 02:33:03.177000', '1', '北京大兴国际机场', 2, '[{\"changed\": {\"fields\": [\"Architect\", \"Build country\"]}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (19, '2020-05-18 02:49:58.369000', '1', '扎哈哈迪德', 2, '[{\"changed\": {\"fields\": [\"Profile\"]}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (20, '2020-05-18 02:53:33.487000', '1', '扎哈哈迪德', 2, '[{\"changed\": {\"fields\": [\"Profile\"]}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (21, '2020-05-18 06:40:03.577000', '1', 'clyde', 2, '[{\"changed\": {\"fields\": [\"Email address\", \"Last login\"]}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (22, '2020-05-18 07:54:37.186000', '2', '神乎其技', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (23, '2020-05-18 07:55:13.124000', '2', '神乎其技', 2, '[{\"changed\": {\"fields\": [\"Staff status\", \"Groups\"]}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (24, '2020-05-18 10:02:12.211000', '3', '<扎哈>', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (25, '2020-05-20 12:36:19.539000', '1', '<Grasshopper鱼鳞片表皮>', 2, '[{\"changed\": {\"fields\": [\"\\u6b63\\u6587\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (26, '2020-05-20 18:02:02.594000', '2', 'python', 2, '[{\"changed\": {\"fields\": [\"Text\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (27, '2020-05-20 18:02:15.893000', '3', '建筑', 2, '[{\"changed\": {\"fields\": [\"Text\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (28, '2020-05-30 13:28:17.310000', '4', '<gdgdsg>', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (29, '2020-05-30 13:28:35.751000', '5', '<官方的>', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (30, '2020-05-30 13:29:04.265000', '6', '<35345t3tge>', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (31, '2020-05-30 13:29:13.980000', '7', '<564yhrth>', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (32, '2020-05-30 13:29:30.976000', '8', '<5643645>', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (33, '2020-05-30 17:45:32.625000', '9', '<gtgfsfsa>', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (34, '2020-05-30 17:45:38.799000', '10', '<656436>', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (35, '2020-05-30 17:45:44.829000', '11', '<56456y43>', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (36, '2020-05-30 18:01:52.502000', '12', '<235435>', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (37, '2020-06-01 15:42:00.510258', '1', '<Grasshopper鱼鳞片表皮>', 2, '[{\"changed\": {\"fields\": [\"\\u6b63\\u6587\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (38, '2020-06-01 16:20:20.620406', '1', '<Grasshopper鱼鳞片表皮>', 2, '[{\"changed\": {\"fields\": [\"\\u6b63\\u6587\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (39, '2020-06-01 16:21:48.847204', '1', '<Grasshopper鱼鳞片表皮>', 2, '[{\"changed\": {\"fields\": [\"\\u6b63\\u6587\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (40, '2020-06-01 16:27:50.281315', '1', '<Grasshopper鱼鳞片表皮>', 2, '[{\"changed\": {\"fields\": [\"\\u6b63\\u6587\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (41, '2020-06-01 16:29:30.783825', '3', '<66哈>', 2, '[{\"changed\": {\"fields\": [\"\\u6807\\u9898\", \"\\u6b63\\u6587\"]}}]', 10, 1);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (11, 'architecture', 'architect');
INSERT INTO `django_content_type` VALUES (14, 'architecture', 'architecture');
INSERT INTO `django_content_type` VALUES (12, 'architecture', 'country');
INSERT INTO `django_content_type` VALUES (13, 'architecture', 'structure');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (10, 'blog', 'article');
INSERT INTO `django_content_type` VALUES (7, 'blog', 'category');
INSERT INTO `django_content_type` VALUES (9, 'blog', 'post');
INSERT INTO `django_content_type` VALUES (8, 'blog', 'tag');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2020-05-31 05:06:44.127049');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2020-05-31 05:06:44.300187');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2020-05-31 05:06:44.856699');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2020-05-31 05:06:44.989345');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2020-05-31 05:06:44.999318');
INSERT INTO `django_migrations` VALUES (6, 'architecture', '0001_initial', '2020-05-31 05:06:45.147920');
INSERT INTO `django_migrations` VALUES (7, 'architecture', '0002_auto_20200518_1017', '2020-05-31 05:06:45.523617');
INSERT INTO `django_migrations` VALUES (8, 'architecture', '0003_auto_20200518_1028', '2020-05-31 05:06:45.873865');
INSERT INTO `django_migrations` VALUES (9, 'architecture', '0004_auto_20200518_1030', '2020-05-31 05:06:46.342429');
INSERT INTO `django_migrations` VALUES (10, 'architecture', '0005_architect_profile', '2020-05-31 05:06:46.363373');
INSERT INTO `django_migrations` VALUES (11, 'architecture', '0006_auto_20200518_1053', '2020-05-31 05:06:46.491033');
INSERT INTO `django_migrations` VALUES (12, 'contenttypes', '0002_remove_content_type_name', '2020-05-31 05:06:46.604728');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0002_alter_permission_name_max_length', '2020-05-31 05:06:46.667560');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0003_alter_user_email_max_length', '2020-05-31 05:06:46.689502');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0004_alter_user_username_opts', '2020-05-31 05:06:46.698477');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0005_alter_user_last_login_null', '2020-05-31 05:06:46.759314');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0006_require_contenttypes_0002', '2020-05-31 05:06:46.763304');
INSERT INTO `django_migrations` VALUES (18, 'auth', '0007_alter_validators_add_error_messages', '2020-05-31 05:06:46.771317');
INSERT INTO `django_migrations` VALUES (19, 'auth', '0008_alter_user_username_max_length', '2020-05-31 05:06:46.843090');
INSERT INTO `django_migrations` VALUES (20, 'auth', '0009_alter_user_last_name_max_length', '2020-05-31 05:06:46.909912');
INSERT INTO `django_migrations` VALUES (21, 'auth', '0010_alter_group_name_max_length', '2020-05-31 05:06:46.927864');
INSERT INTO `django_migrations` VALUES (22, 'auth', '0011_update_proxy_permissions', '2020-05-31 05:06:46.938835');
INSERT INTO `django_migrations` VALUES (23, 'blog', '0001_initial', '2020-05-31 05:06:47.033581');
INSERT INTO `django_migrations` VALUES (24, 'blog', '0002_auto_20200516_0125', '2020-05-31 05:06:47.382648');
INSERT INTO `django_migrations` VALUES (25, 'blog', '0003_auto_20200517_2156', '2020-05-31 05:06:47.641207');
INSERT INTO `django_migrations` VALUES (26, 'blog', '0004_auto_20200518_0220', '2020-05-31 05:06:47.816711');
INSERT INTO `django_migrations` VALUES (27, 'blog', '0005_auto_20200518_0314', '2020-05-31 05:06:47.947363');
INSERT INTO `django_migrations` VALUES (28, 'blog', '0006_auto_20200518_1728', '2020-05-31 05:06:47.956339');
INSERT INTO `django_migrations` VALUES (29, 'blog', '0007_auto_20200521_0151', '2020-05-31 05:06:48.346296');
INSERT INTO `django_migrations` VALUES (30, 'blog', '0008_auto_20200530_2140', '2020-05-31 05:06:48.355273');
INSERT INTO `django_migrations` VALUES (31, 'sessions', '0001_initial', '2020-05-31 05:06:48.378211');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('i77c4173upz2lbyz87soikak9y0kcm1c', 'NGUxMTIyZjdhYmQxMTM2N2ZkYmI3OWZlZDAxMWUxNWY0MWMwNjBiYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1ZWY3NGQxMGY4YTYwMDlmZjYzYTcyNmI3OWYxZDZiYTg5ODE3OTEzIn0=', '2020-06-14 05:54:18.757938');
INSERT INTO `django_session` VALUES ('npkyty5htdmo362woup16o3s27wz2vrq', '.eJxVjDEOwjAMRe_iGUW1QpOUkZ0zRHZsSAElUtNOiLu3lTrA-t97_wORljnHpekUR4ELIJx-N6b00rIDeVJ5VJNqmaeRza6YgzZzq6Lv6-H-HWRqeattcog2nEkTsqB2vtfh7kJnvbpBpA8qzOLhuwLyXzGp:1jbNwx:QPTzXGO48yr6FMSE_2WCJI8rKZUZHJygHnjdGK5gy5I', '2020-06-03 12:35:55.004000');
INSERT INTO `django_session` VALUES ('xd0f642wu1kwalawkzydemkcrnz5qsyb', 'NGUxMTIyZjdhYmQxMTM2N2ZkYmI3OWZlZDAxMWUxNWY0MWMwNjBiYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1ZWY3NGQxMGY4YTYwMDlmZjYzYTcyNmI3OWYxZDZiYTg5ODE3OTEzIn0=', '2020-06-03 18:01:41.749000');

SET FOREIGN_KEY_CHECKS = 1;
