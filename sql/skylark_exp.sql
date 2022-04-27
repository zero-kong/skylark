/*
 Navicat Premium Data Transfer

 Source Server         : mysql-connect
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : skylark

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 26/04/2022 11:11:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for algo_regrestion
-- ----------------------------
DROP TABLE IF EXISTS `algo_regrestion`;
CREATE TABLE `algo_regrestion`  (
  `algo_id` bigint(0) NOT NULL COMMENT '编号',
  `algo_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `algo_type` tinyint(0) NULL DEFAULT NULL COMMENT '0-Tensorflow;\r\n1-Pytorch;\r\n2-自定义',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `config` json NULL COMMENT '模型配置参数',
  `status` int(0) NULL DEFAULT NULL COMMENT '0-正常；1-异常； ',
  `gmt_create` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(6) NULL DEFAULT NULL COMMENT '更新时间',
  `storage` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模型调用地址',
  PRIMARY KEY (`algo_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of algo_regrestion
-- ----------------------------

-- ----------------------------
-- Table structure for job_log
-- ----------------------------
DROP TABLE IF EXISTS `job_log`;
CREATE TABLE `job_log`  (
  `id` bigint(0) NOT NULL COMMENT '主键',
  `job_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联作业',
  `gmt_create` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_end` datetime(6) NULL DEFAULT NULL COMMENT '结束时间',
  `log` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '日志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of job_log
-- ----------------------------

-- ----------------------------
-- Table structure for job_operation
-- ----------------------------
DROP TABLE IF EXISTS `job_operation`;
CREATE TABLE `job_operation`  (
  `id` bigint(0) NOT NULL COMMENT '主键',
  `job_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联作业',
  `gmt_create` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `operator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作者',
  `command` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作命令',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of job_operation
-- ----------------------------

-- ----------------------------
-- Table structure for job_version
-- ----------------------------
DROP TABLE IF EXISTS `job_version`;
CREATE TABLE `job_version`  (
  `id` bigint(0) NOT NULL COMMENT '作业版本id(主键)',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '作业版本名称',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '作业版本创建者',
  `storage` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '作业版本存放位置',
  `status` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '作业版本状态',
  `gmt_create` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(6) NULL DEFAULT NULL COMMENT '更新时间',
  `task_id` int(0) NOT NULL COMMENT '依赖的作业详情表的id(外键）',
  `version` double NULL DEFAULT NULL COMMENT '作业版本的版本号',
  `evaluation` json NULL COMMENT '评估参数指标',
  `result_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '训练结果文件',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of job_version
-- ----------------------------

-- ----------------------------
-- Table structure for model_info
-- ----------------------------
DROP TABLE IF EXISTS `model_info`;
CREATE TABLE `model_info`  (
  `id` bigint(0) NOT NULL COMMENT '作业版本id(主键)',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模型名称',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模型创建者',
  `storage` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '存放位置',
  `status` tinyint(0) NULL DEFAULT NULL COMMENT '发布状态',
  `version` double NULL DEFAULT NULL COMMENT '版本号',
  `evaluation` json NULL COMMENT '评估参数指标',
  `inputs` json NULL COMMENT '输入参数信息',
  `time_scale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '时间粒度',
  `forcast_length` int(0) NULL DEFAULT NULL COMMENT '预测长度',
  `descrition` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述信息/特性',
  `result_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '训练结果文件',
  `gmt_create` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(6) NULL DEFAULT NULL COMMENT '更新时间',
  `task_id` int(0) NOT NULL COMMENT '依赖的任务',
  `job_id` int(0) NOT NULL COMMENT '依赖的作业',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of model_info
-- ----------------------------

-- ----------------------------
-- Table structure for task_info
-- ----------------------------
DROP TABLE IF EXISTS `task_info`;
CREATE TABLE `task_info`  (
  `task_id` bigint(0) NOT NULL COMMENT '作业编号（主键）',
  `task_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '作业名称',
  `task_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '作业类型',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `config` json NULL COMMENT '用户提交的模型参数',
  `status` tinyint(0) NULL DEFAULT NULL COMMENT '0-正常；1-异常；2-成功；3-失败',
  `gmt_create` datetime(6) NULL DEFAULT NULL COMMENT '作业创建时间',
  `gmt_modified` datetime(6) NULL DEFAULT NULL COMMENT '作业更新时间',
  `storage` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '训练结果保存地址',
  `dataset_id` bigint(0) NULL DEFAULT NULL COMMENT '关联的数据文件',
  `algo_id` bigint(0) NULL DEFAULT NULL COMMENT '关联算法（外键）',
  PRIMARY KEY (`task_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task_info
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
