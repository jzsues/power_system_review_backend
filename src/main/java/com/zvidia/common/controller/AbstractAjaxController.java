/**
 * 
 */
package com.zvidia.common.controller;

import java.util.concurrent.Callable;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zvidia.common.entity.AjaxResponse;
import com.zvidia.common.mvc.AjaxPaginationFactory;
import com.zvidia.common.mvc.AjaxPaginationResponse;

/**
 * @author jiangzm
 * 
 */
public abstract class AbstractAjaxController<T, ID> {
	protected Log logger = LogFactory.getLog(getClass());

	public final static int DEFAULT_PAGE_INDEX = 0;

	public final static int DEFAULT_PAGE_SIZE = 10;

	@Autowired
	protected AjaxPaginationFactory ajaxPaginationFactory;

	protected AjaxPaginationFactory getAjaxPaginationFactory() {
		return ajaxPaginationFactory;
	}

	/**
	 * 生成查询列表页面的时附带AjaxResponse.addition数据
	 * 
	 * @param request
	 * @return
	 */
	protected abstract Object beforeFTLRender(HttpServletRequest request);

	/**
	 * 保存数据前处理
	 * 
	 * @param entity
	 * @param request
	 */
	protected abstract void beforeSaveRequest(T entity, HttpServletRequest request);

	/**
	 * 查询分页结果
	 * 
	 * @param pageable
	 * @return
	 */
	protected abstract Page<T> doPageQuery(Pageable pageable);

	/**
	 * 处理返回的分页结果
	 * 
	 * @param result
	 */
	protected abstract void afterPageQuery(Page<T> result);

	/**
	 * 保存数据
	 * 
	 * @param entity
	 * @return
	 */
	protected abstract T doSave(T entity);

	/**
	 * 删除数据
	 * 
	 * @param id
	 */
	protected abstract void doDelete(ID id);

	/**
	 * 获取数据
	 * 
	 * @param id
	 * @return
	 */
	protected abstract T doGet(ID id);

	@RequestMapping("/page")
	public @ResponseBody
	Callable<AjaxResponse> page(final @RequestParam(value = "callback", required = false) String callback,
			final @RequestParam(value = "ftl", required = false) String ftl, final HttpServletRequest request) {
		return new Callable<AjaxResponse>() {
			@Override
			public AjaxResponse call() throws Exception {
				Object addition = beforeFTLRender(request);
				AjaxResponse ajaxResponse = new AjaxResponse(addition);
				ajaxResponse.setFtl(ftl);
				ajaxResponse.setCallback(callback);
				return ajaxResponse;
			}

		};
	}

	@RequestMapping("/ajax/list")
	public @ResponseBody
	Callable<AjaxPaginationResponse> list(final HttpServletRequest request) {
		return new Callable<AjaxPaginationResponse>() {
			@Override
			public AjaxPaginationResponse call() throws Exception {
				AjaxPaginationFactory ajaxPaginationFactory = getAjaxPaginationFactory();
				Pageable pageable = (ajaxPaginationFactory == null) ? new PageRequest(DEFAULT_PAGE_INDEX, DEFAULT_PAGE_SIZE)
						: ajaxPaginationFactory.pageable(request);
				Sort sort = new Sort(Direction.DESC, "updated");
				pageable.getSort().and(sort);
				Page<T> result = doPageQuery(pageable);
				afterPageQuery(result);
				AjaxPaginationResponse response = ajaxPaginationFactory.response(request, result);
				return response;
			}
		};
	}

	@RequestMapping(value = "/ajax/save", method = { RequestMethod.POST })
	public @ResponseBody
	Callable<AjaxResponse> save(final @RequestBody T entity, final HttpServletRequest request) {
		return new Callable<AjaxResponse>() {

			@Override
			public AjaxResponse call() throws Exception {
				beforeSaveRequest(entity, request);
				T doSaved = doSave(entity);
				return new AjaxResponse(doSaved);
			}

		};
	}

	@RequestMapping(value = "/ajax/{id}", method = { RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody
	Callable<AjaxResponse> get(final @PathVariable("id") ID id) {
		return new Callable<AjaxResponse>() {

			@Override
			public AjaxResponse call() throws Exception {
				T doSaved = doGet(id);
				return new AjaxResponse(doSaved);
			}

		};
	}

	@RequestMapping(value = "/ajax/del/{id}", method = { RequestMethod.POST })
	public @ResponseBody
	Callable<AjaxResponse> del(final @PathVariable("id") ID id) {
		return new Callable<AjaxResponse>() {

			@Override
			public AjaxResponse call() throws Exception {
				doDelete(id);
				return new AjaxResponse();
			}

		};
	}
}
