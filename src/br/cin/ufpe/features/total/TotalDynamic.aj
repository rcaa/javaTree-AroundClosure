package br.cin.ufpe.features.total;

import driver.util.Util;

public aspect TotalDynamic {

	Object around() : adviceexecution() && within(br.cin.ufpe.features.total.TotalFeature){
		Object ret = null;
		if (driver.util.Driver.isActivated("total")) {
			ret = proceed();
		} else {
			try {
				ret = Util.proceedAroundCall(thisJoinPoint);
			} catch (Throwable e) {
				e.printStackTrace();
			}
		}
		return ret;
	}
}