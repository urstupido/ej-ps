package com.sds.ps.domain;

import anyframe.common.util.SearchVO;


public class CommonVo extends SearchVO {

	private static final long serialVersionUID = -1862124330862852473L;

	/**
	 * 한페이지에 표시되는 데이터건수
	 */
	private static final int INIT_RECORD_COUNT_PER_PAGE = 10;

	/**
	 * 최초 페이지 인덱스 설정
	 */
	private static final int INIT_PAGE_INDEX = 1;

	/**
	 * 페이징에서 보여지는 페이지의 수
	 */
	private static final int INIT_PAGE_SIZE = 10;

	/**
	 * 현재 페이지 No
	 */
	private int currentPageNo;

	/**
	 * 페이지별 레코드 카운트
	 */
	private int recordCountPerPage;

	/**
	 * 한페이지당 출력할 record수
	 */
	private int pageSize;

	/**
	 * 총 record 수
	 */
	private int totalRecordCount;

	/**
	 * 총 페이지 수
	 */
	private int totalPageCount;

	/**
	 * 첫번째 페이지 번호
	 */
	private int firstPageNoOnPageList;

	/**
	 * 마지막 페이지 번호
	 */
	private int lastPageNoOnPageList;

	/**
	 * 첫번째 레코드 인덱스
	 */
	private int firstRecordIndex;

	/**
	 * 마지막 레코드 인덱스
	 */
	private int lastRecordIndex;

	/**
	 * 정렬 컬럼
	 */
	private String sidx;

	/**
	 * 정렬 방식
	 */
	private String sord;

	/**
	 * 목록 페이징시 페이지 번호
	 */
	private int page;

	/**
	 * 페이징시 row 갯수 반환
	 */
	private int rows;

	/**
	 * 검색시작일
	 */
	private String searchFromDt;

	/**
	 * 검색종료일
	 */
	private String searchToDt;

	public CommonVo() {
		setCurrentPageNo(INIT_PAGE_INDEX);
		setPageSize(INIT_PAGE_SIZE);
		setRecordCountPerPage(INIT_RECORD_COUNT_PER_PAGE);
		setSidx("");
		setSord("");
	}

	public int getLastPageNoOnPageList() {
		this.lastPageNoOnPageList = (getFirstPageNoOnPageList() + getPageSize() - 1);
		if (this.lastPageNoOnPageList > getTotalPageCount()) {
			this.lastPageNoOnPageList = getTotalPageCount();
		}
		return lastPageNoOnPageList;
	}

	public void setLastPageNoOnPageList(int lastPageNoOnPageList) {
		this.lastPageNoOnPageList = lastPageNoOnPageList;
	}

	public int getFirstRecordIndex() {
		this.firstRecordIndex = ((getCurrentPageNo() - 1) * getRecordCountPerPage());
		return firstRecordIndex;
	}

	public void setFirstRecordIndex(int firstRecordIndex) {
		this.firstRecordIndex = firstRecordIndex;
	}

	public int getLastRecordIndex() {
		this.lastRecordIndex = (getCurrentPageNo() * getRecordCountPerPage());
		return lastRecordIndex;
	}

	public void setLastRecordIndex(int lastRecordIndex) {
		this.lastRecordIndex = lastRecordIndex;
	}

	public int getCurrentPageNo() {
		return currentPageNo;
	}

	public void setCurrentPageNo(int currentPageNo) {
		this.currentPageNo = currentPageNo;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalRecordCount() {
		return totalRecordCount;
	}

	public void setTotalRecordCount(int totalRecordCount) {
		this.totalRecordCount = totalRecordCount;
	}

	public int getTotalPageCount() {
		this.totalPageCount = ((getTotalRecordCount() - 1)
				/ getRecordCountPerPage() + 1);
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getFirstPageNoOnPageList() {
		this.firstPageNoOnPageList = ((getCurrentPageNo() - 1) / getPageSize()
				* getPageSize() + 1);
		return firstPageNoOnPageList;
	}

	public void setFirstPageNoOnPageList(int firstPageNoOnPageList) {
		this.firstPageNoOnPageList = firstPageNoOnPageList;
	}

	public String getSidx() {
		return sidx;
	}

	public void setSidx(String sidx) {
		this.sidx = sidx;
	}

	public String getSord() {
		return sord;
	}

	public void setSord(String sord) {
		this.sord = sord;
	}


	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
		setCurrentPageNo(page);
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
		setRecordCountPerPage(rows);
	}

	public String getSearchFromDt() {
		return searchFromDt;
	}

	public void setSearchFromDt(String searchFromDt) {
		this.searchFromDt = searchFromDt;
	}

	public String getSearchToDt() {
		return searchToDt;
	}

	public void setSearchToDt(String searchToDt) {
		this.searchToDt = searchToDt;
	}

	@Override
	public String toString() {
		return "CommonVo [currentPageNo=" + currentPageNo
				+ ", recordCountPerPage=" + recordCountPerPage + ", pageSize="
				+ pageSize + ", totalRecordCount=" + totalRecordCount
				+ ", totalPageCount=" + totalPageCount
				+ ", firstPageNoOnPageList=" + firstPageNoOnPageList
				+ ", lastPageNoOnPageList=" + lastPageNoOnPageList
				+ ", firstRecordIndex=" + firstRecordIndex
				+ ", lastRecordIndex=" + lastRecordIndex + ", sidx=" + sidx
				+ ", sord=" + sord + ", page=" + page + ", rows=" + rows
				+ ", searchFromDt=" + searchFromDt + ", searchToDt="
				+ searchToDt + "]";
	}

	public String bindExportFormat() {
		return "";
	}
}