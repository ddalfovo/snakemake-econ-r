#' tab02_augment_solow.R
#'
#' contributors: @lachlandeer, @julianlanger, @bergmul
#'
#' Table for Augmented Solow Model, 
#' Table 2 of MRW
#'

# Create Table
stargazer(data$model_aug_solow_ols_subset_nonoil,
          data$model_aug_solow_ols_subset_intermediate,
          data$model_aug_solow_ols_subset_oecd,
          data$model_aug_solow_restr_ols_subset_nonoil,
          data$model_aug_solow_restr_ols_subset_intermediate,
          data$model_aug_solow_restr_ols_subset_oecd,
          initial.zero = TRUE,
          align = FALSE,
          style = "qje",
          title = "Estimation of the Augmented Solow Model",
          dep.var.labels = "log(GDP per capita in 1965)",
          column.labels = c("Non-Oil", "Intermediate", "OECD",
                            "Non-Oil", "Intermediate", "OECD"),
          covariate.labels = c("log(I / GDP)",
                               "log(n + g + $\\delta$)",
                               "log(school)",
                               "log(I / GDP) - log(n + g + $\\delta$)",
                               "log(school) - log(n + g + $\\delta$)"
                               ),
          add.lines = list(
              c("Restricted Model", "No", "No", "No", "Yes", "Yes", "Yes")
          ),
          omit.stat = c("rsq", "ser", "F"),
          df = FALSE,
          digits = 2,
          font.size = "scriptsize",
          table.layout ="-dc#-t-a-s=n",
          no.space = TRUE,
          type = "latex",
          out = opt$out
          )
