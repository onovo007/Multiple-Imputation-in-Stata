///* Multiple Inputation using the Multivariate normal distribution (MVN), Based on the MCMC, Bayesian Model

/// Identifying Missing values using mdesc command
mdesc Country_new who_region reported_cases reported_deaths case_fatality_rate

/// Setting data for inputation
/// The mi set mlong command generates three variables that will be used by Stata to track the imputed datasets and values)
mi set mlong

/// Summarizing missing values
mi misstable summarize Country_new who_region reported_cases reported_deaths case_fatality_rate

/// Summarizing Missing Patterns
mi misstable patterns reported_cases reported_deaths case_fatality_rate

/// Registering the variables to be imputed
mi register imputed reported_cases reported_deaths case_fatality_rate

/// Specifying the imputed model
mi impute mvn reported_cases reported_deaths case_fatality_rate, add(10) rseed (53421)

/// Using Linear regression model to estimate the missing values
mi estimate: regress reported_cases reported_deaths case_fatality_rate

/// Imputation Diagnostic: Assessing well how the imputation performed
mi estimate, vartable dftable