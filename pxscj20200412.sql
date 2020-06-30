-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2020-04-12 22:54:20
-- 服务器版本： 5.7.26
-- PHP 版本： 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `pxscj`
--
CREATE DATABASE IF NOT EXISTS `pxscj` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `pxscj`;

-- --------------------------------------------------------

--
-- 表的结构 `cjb`
--

CREATE TABLE `cjb` (
  `XH` char(6) NOT NULL,
  `KCH` char(3) NOT NULL,
  `CJ` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cjb`
--

INSERT INTO `cjb` (`XH`, `KCH`, `CJ`) VALUES
('081101', '101', 80),
('081101', '102', 78),
('081101', '206', 76),
('081102', '102', 78),
('081102', '206', 78),
('081103', '101', 62),
('081103', '102', 70),
('081103', '206', 81),
('081104', '101', 90),
('081104', '102', 84),
('081104', '206', 65),
('081106', '101', 65),
('081106', '102', 71),
('081106', '206', 80),
('081107', '101', 78),
('081107', '102', 80),
('081107', '206', 68),
('081108', '101', 85),
('081108', '102', 64),
('081108', '206', 87),
('081109', '101', 66),
('081109', '102', 83),
('081109', '206', 70),
('081110', '101', 95),
('081110', '102', 90),
('081110', '206', 89),
('081111', '101', 91),
('081111', '102', 70),
('081111', '206', 76),
('081113', '101', 63),
('081113', '206', 60),
('081201', '101', 80),
('081202', '101', 65),
('081203', '101', 87),
('081204', '101', 97),
('081210', '101', 76),
('081216', '101', 81),
('081218', '101', 70),
('081220', '101', 82),
('081221', '101', 76),
('081241', '101', 90);

-- --------------------------------------------------------

--
-- 表的结构 `kcb`
--

CREATE TABLE `kcb` (
  `KCH` char(3) NOT NULL,
  `KCM` varchar(16) NOT NULL,
  `KKXQ` tinyint(1) DEFAULT '1',
  `XS` tinyint(1) DEFAULT NULL,
  `XF` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `kcb`
--

INSERT INTO `kcb` (`KCH`, `KCM`, `KKXQ`, `XS`, `XF`) VALUES
('101', '计算机基础', 1, 80, 5),
('102', '程序设计与语言', 2, 68, 4),
('206', '离散数学', 4, 68, 4),
('208', '数据结构', 5, 68, 4),
('209', '操作系统', 6, 68, 4),
('210', '计算机原理', 5, 85, 5),
('212', '数据库原理', 7, 68, 4),
('301', '计算机网络', 7, 51, 3),
('302', '软件工程', 7, 51, 3);

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE `users` (
  `userid` varchar(20) COLLATE utf8_bin NOT NULL,
  `pwd` varchar(20) COLLATE utf8_bin NOT NULL,
  `xm` varchar(10) COLLATE utf8_bin NOT NULL,
  `usertype` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '2',
  `photo` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`userid`, `pwd`, `xm`, `usertype`, `photo`) VALUES
('admin', '123', '张三', '1', 0x47494638396123002300f70000000000fffffff9fcfd3e3b3c898889474648fcfdfe9cbdda9cbdd891b6d396b9d499bcd79abdd799bbd48ab2ce99c0da99bdd5585b5d7d8082b1b4b6f9fcfe6291af6a97b36e9ab678a3be7ca8c382adc88eb7d199c2db9bc3dd98c0d997bdd69ec6df9dc4dd9ac0d99bc1da9bc2da9bc1d89abfd7a1c8e09dc2da9bbfd5a2c6dce5f2fa6995af729fba85b2cb8ab6ce8db7ce95bfd892bcd494bdd59bc6de9cc4dba2cae1a1c9e096bbd0a2c9e0a6cce2accee2b1d2e4b0d0e2b3d3e5cee5f2cfe6f3cce2eedeeaf1c1c6c991c0d791bbd1a8c6d6b6d5e5b9d7e7bddae9c2ddebc6e0edcce6f4cce5f2c9e1eecde4f0d0e5f0d3e7f1daebf4dfedf4d9e5ebeef6faf3f9fcf7fbfdfbfdfe8cb7ca8bb6c98bb5c88cb5c765808d96bdd099bfd19dc3d5a5cbdcc7dfead6e9f2daecf4ddecf3e0eff6d3dce06a9aaf8cb7c98eb9cb8cb6c78ab2c3779aa8a0c4d3acd1e0b5d3dfbad6e1cce7f2c3dbe5c9dee7cee2ead7e8efd5e6edddedf4dbebf2dbeaf0dae9efdeecf28ab5c56a8b9782a9b88cb5c57fa4b292bccca3c8d5adcedacae0e8cfe5edb7cbd2cbe0e8d0e3ead3e5ecddeff6c5d5dbdfeff5d5e0e488b1bfa8cbd79eb6bebedae3ddf2f9e1f1f69b9e9fd1d4d597bbc6b2d2dbd1e5ebdfedf1d8eef38bbac3759499b9c6c8879799c2d2d4fefffffdfefea6a7a7abc9c887b8b46a918a7eb4a864767272ae9f5d877d66a9965c8d7e959897659a867faf9b8dbeaa6aac906aaa8e73b59872b29681b79f62ac8b5ea4846cab8e72b09370ad9176b2967db99e5fad8867b18d65ad8a68aa8a6db19071b69566a587619b7f78b59883bca17caa9469ac8b6dae8e77b5968ec2a864ab856ca0837c7c6bd0d0cfcdcdccc7c7c6837757a8a49ab4ada1c8c0b396938e9b8667a0917cb18f66b7966ebea17eac967ce2cfb8e8d7c2e6d6c3dacbb9e7d9c7b8b3ad8a61356e50309c7345aa835891785bb99a76c3a481c5a887c8ae90cdb497d1b99dd5bda1dbc4aaaf9f8deadac8efe0cfeadccce9ded2eee3d7f1e6dbd2d1d093673f8b6746a47d5a926d4f9f8269c2c1c1bbbbbbffffff21f904010000ff002c00000000230023000008ff0003081c48b0a0c1830875d858c8b0a18d1c1073385c1831e2431d0341e069c4710a1e3c654296e11392cf148e66cc341ac9a7654b4d7a400cbc8147e5949b37cbdce42344081f3394825232c34793d1a39af69c1878420a192952f248954ae58ca5ab571de599b4a88c9eaf60f7ecb9235320883152c6a8556bc7eabd67d0a245ebd72fda19a776f2e6bdc33751d90021a28c894298f099b975a1c19debcfdf904c7614dd51a42853a23a856a0cacf1048a674350e84c18459af4047ffd1a4f385dc7d0e53a880ad199c3612007274f82e80e225a1c3870d5c48daa54a9f4704fb0e9cc9e33479287811e963871b2448c98254be8c993372f1e7071d4a611ff6f356a8e98e692d2c78931308692254ae22b4932875ebdfbf4e279ebf6ae5dab56d65873c81c711458201c330c344312f3259184244930428f3df6d493df37fcb5038f350410400a127084182226320c2403120e2681c48a1252686138fcb9c38e3af048208111701082c98e981052c4401b1c81c411441ee10328f2e0174f37e0f4b74e3adca02201215442422521906c00a40f44fae0030f3c80e2cd3cf36018e38ce83813c1276f40e2e69b90c030d00b60f2d0c39d3b1cd2cd9e7bbe23a33ae9f0134104978431c8a1880ef2c2400ee8b0c3a3901ef2cea47efeb98d361114f049186e74eaa91b5fb830900b348010820aa8e660443bedb8e34e3beba8ff830e3ae70c804a09607ce1c5ae82a8a186161a0ca44108219040c2082394c00135e9009a0e3ad998a30f391114514416d8668b6d1ac10aa4410721d4706c09ca46a2cdb9d19653ce3805b840c4165a689bc6bc6b741b80061ca060ec0826a4900207d39823adbae390438e1a446411afc259cc9bc61a1904204a001990a0af082294e0af090b60b3ee38051b8c4a1b5bc0a005bc5a380c71281367f0c0b119f78b40039c9c720d3ef9183c4e3ea8a0624a203064b1c5166b14dd0706a118108acb24606c02030c5c724a2ebb70a3cf3ef9e4838f34aa10338c2b9db0a1061745af71b428588482810723886082091094524b2dcabc62f53e58e3e38c2bb2c8ff92cc30a63c92451f669f7d85da1eb8cdc001a528030b2cc5bc82cdd55a4be34a2cb2e0e237e08facc10520868bb2b6080c2080032dbbcc4dcb31adc0c30f3fd834138b2eb9e4a20b32be10d309179ff7d182285688d2c207501ff04832bae8b2cbea9580e20928b50ca3fcdcc524f3cb2fac04d207206cb46040f0c333b0c002a720830b2eba04c3ba219b90728b2cb9d402cb32c604f38b2dc4f811c823dd7f2ffc070b50400252c10c6420c37aba68c52436518c61e06217c65806fd84618b5edc42157e68c31f2e80852a084f010274c02a9871bd5ff442179f58012686018c64142382f49bc52f6e71c12e74a10d1cf4a00512b00107686015bdb08510707b818c4f000116ef531e2f8c610c5ed0c2163464850dfd50810e52000317c8e205d0c0c52ea281052df0a218b9c8023454800568c4801556500501b8f18d708ca31ce17885385ac10c2bc823109ac0c73ef6f1077290031380f0033e32e1073f600213f828872630410e8504c20a0202003b);

-- --------------------------------------------------------

--
-- 表的结构 `xsb`
--

CREATE TABLE `xsb` (
  `XH` char(6) NOT NULL,
  `XM` char(8) NOT NULL,
  `XB` tinyint(1) DEFAULT '1',
  `CSSJ` date DEFAULT NULL,
  `ZY` varchar(12) DEFAULT NULL,
  `ZXF` int(4) DEFAULT '0',
  `BZ` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `xsb`
--

INSERT INTO `xsb` (`XH`, `XM`, `XB`, `CSSJ`, `ZY`, `ZXF`, `BZ`) VALUES
('081101', '王林', 1, '1990-02-10', '计算机', 50, NULL),
('081102', '程明', 1, '1991-02-01', '计算机', 50, NULL),
('081103', '王燕', 0, '1989-10-06', '计算机', 50, NULL),
('081104', '韦严平', 1, '1990-08-26', '计算机', 50, NULL),
('081106', '李方方', 1, '1990-11-20', '计算机', 50, NULL),
('081107', '李明', 1, '1990-05-01', '计算机', 54, '提前修完《数据结构》，并获XF'),
('081108', '林一帆', 1, '1989-08-05', '计算机', 52, '已提前修完一门课程'),
('081109', '张强民', 1, '1989-08-11', '计算机', 50, NULL),
('081110', '张蔚', 0, '1991-07-22', '计算机', 50, '三好生'),
('081111', '赵琳', 0, '1990-03-18', '计算机', 50, NULL),
('081113', '严红', 0, '1989-08-11', '计算机', 48, '有一门课不及格，待补考'),
('081201', '王敏', 1, '1989-06-10', '通信工程', 42, NULL),
('081202', '王林', 1, '1989-01-29', '通信工程', 40, '有一门课不及格，待补考'),
('081203', '王玉民', 1, '1990-03-26', '通信工程', 42, NULL),
('081204', '马琳琳', 0, '1989-02-10', '通信工程', 42, NULL),
('081206', '李计', 1, '1989-09-20', '通信工程', 42, NULL),
('081210', '李红庆', 1, '1989-05-01', '通信工程', 44, '已提前修完一门课，并获XF'),
('081216', '孙祥欣', 1, '1989-03-19', '通信工程', 42, NULL),
('081218', '孙研', 1, '1990-10-09', '通信工程', 42, NULL),
('081220', '吴薇华', 0, '1990-03-18', '通信工程', 42, NULL),
('081221', '刘燕敏', 0, '1989-11-12', '通信工程', 42, NULL),
('081241', '罗琳琳', 0, '1990-01-30', '通信工程', 50, '转ZY学习');

--
-- 转储表的索引
--

--
-- 表的索引 `cjb`
--
ALTER TABLE `cjb`
  ADD PRIMARY KEY (`XH`,`KCH`);

--
-- 表的索引 `kcb`
--
ALTER TABLE `kcb`
  ADD PRIMARY KEY (`KCH`);

--
-- 表的索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`);

--
-- 表的索引 `xsb`
--
ALTER TABLE `xsb`
  ADD PRIMARY KEY (`XH`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
