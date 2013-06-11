/**
 * 
 */
package com.zvidia.backend.config;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Component;

import com.zvidia.backend.repository.ApplicationRepository;
import com.zvidia.common.config.AbstractApplicationConfigHolder;
import com.zvidia.common.entity.ApplicationInfo;

/**
 * @author jiangzm
 * 
 */
@Component
public class ApplicationHolder implements AbstractApplicationConfigHolder {

	@Autowired
	private ApplicationRepository applicationRepository;

	private ApplicationInfo applicationInfo;

	@Override
	public void afterPropertiesSet() throws Exception {
		Sort sort = new Sort(Direction.DESC, "updated");
		List<ApplicationInfo> configs = applicationRepository.findAll(sort);
		if (configs != null && configs.size() > 0) {
			applicationInfo = configs.get(0);
		}
	}

	@Autowired
	public ApplicationInfo getApplicationInfo() {
		return applicationInfo;
	}

}
