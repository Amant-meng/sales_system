package com.ccut.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.ccut.entity.Log;

/**
 * 系统日志Repository接口
 * @author Meng.Yang
 *
 */
public interface LogRepository extends JpaRepository<Log, Integer>,JpaSpecificationExecutor<Log>{


}
