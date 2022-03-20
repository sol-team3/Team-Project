package com.sol.squid.scrap;

import java.util.List;

public interface ScrapMapper {

	List<Scrap> getAllScrap(Scrap scrap);

	int addScrap(Scrap scrap);

}
