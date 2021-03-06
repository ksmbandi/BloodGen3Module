% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fingerprintplot.R
\name{fingerprintplot}
\alias{fingerprintplot}
\title{Individual fingerprint visualization
The fingerprintplot function will generate fingerprint heatmap plots as a pdf file. The file will be saved in the working directory specified for the analysis.
The default cut off for visualization is set at 15\%, it can be changed to any value between 0-100\%.}
\usage{
fingerprintplot(
  Individual_df,
  sample_info = sample_info,
  cutoff = NULL,
  rowSplit = TRUE,
  Ref_group = NULL,
  show_ref_group = FALSE,
  Group_column = NULL,
  Aggregate = NULL,
  filename = NULL,
  height = NULL,
  width = NULL
)
}
\arguments{
\item{Individual_df}{Dataframe with output generated after running the 'Individualcomparison' function}

\item{sample_info}{A dataframe with sample annotation.}

\item{cutoff}{Numeric value specifying the percentage cut off used for fingerprint visualization ( 0 to 100).}

\item{rowSplit}{Logical operator (TRUE/FALSE) to indicate if rows of the heatmaps should be split by each aggregate}

\item{Ref_group}{Characters name of reference group or samples that considered as control}

\item{show_ref_group}{Character vector specifying value within the group column that will be used as Reference group}

\item{Group_column}{Name of the columns for the groups used for the analysis}

\item{Aggregate}{Character vector specifying name of specific module aggregates    for heatmap fingerprint plot}

\item{filename}{Character vector with a name for saving file}

\item{height}{Sets the height of the graphics region in inches. The default values are 28}

\item{width}{Sets the width of the graphics region in inches. The default values are 17}
}
\value{
\preformatted{          A heatmap of \% of module response in each single sample
}
}
\description{
Individual fingerprint visualization
The fingerprintplot function will generate fingerprint heatmap plots as a pdf file. The file will be saved in the working directory specified for the analysis.
The default cut off for visualization is set at 15\%, it can be changed to any value between 0-100\%.
}
\examples{
## example sample information Example expression
## data for package testting
Test_sample = matrix(data = rexp(1000, rate = 0.01),
                    nrow = 14168, ncol = 20)
control_sample = matrix(data = rexp(1000, rate = 0.1),
                       nrow = 14168, ncol = 10)
data.matrix = data.frame(cbind(Test_sample, control_sample))
data.matrix$Symbol = Module_listGen3$Gene
data.matrix = aggregate(data.matrix[,-31], FUN = mean, by = list(data.matrix$Symbol))
rownames(data.matrix) = data.matrix$Group.1
data.matrix$Group.1 = NULL
colnames(data.matrix) = c(paste0(rep("SampleID", 30),
                                1:30))
## Example of ample information
sample_ann = data.frame(SampleID = (colnames(data.matrix)),
                       Group_test = c(rep("Test", 20), rep("Control",
                                                           10)), stringsAsFactors = FALSE)
rownames(sample_ann) = sample_ann$SampleID
Individual_df = Individualcomparison(data.matrix, sample_info = sample_ann,
                                    FC = 1.5, DIFF = 10, Group_column = "Group_test",
                                    Ref_group = "Control")
fingerprintplot(Individual_df, sample_info = sample_ann,
               cutoff = 15, rowSplit = TRUE, Ref_group = "Control",
               show_ref_group = FALSE, Group_column = "Group_test",
               Aggregate = c("A28"), filename = "Individual_comparison", height = 5,
               width = 10)
}
\author{
Darawan Rinchai \href{mailto:drinchai@gmail.com}{drinchai@gmail.com}
}
