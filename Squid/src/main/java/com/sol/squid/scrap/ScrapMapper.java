package com.sol.squid.scrap;

import java.util.List;

public interface ScrapMapper {

	List<Scrap> getAllScrap(Scrap scrap);

	int addScrap(Scrap scrap);

	Scrap getScrap(Scrap scrap);

	int deleteScrap(Scrap scrap);

	int addScrap_c(Scrap scrap);

	Scrap getScrap_c(Scrap scrap);

	List<Scrap> getAllScrap_c(Scrap scrap);

	int deleteScrap_c(Scrap scrap);

}
