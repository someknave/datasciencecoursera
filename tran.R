load(url("http://bit.ly/dasi_gss_data"))
tran <- gss[!is.na(gss$natmass), c("caseid","year","sei","incom16","income06","natmass")]

seitran <- tran[!is.na(tran$sei),c("sei", "natmass")]
inctran <- tran[!is.na(tran$income06),c("income06", "natmass")]
inc16tran <- tran[!is.na(tran$incom16),c("incom16", "natmass")]