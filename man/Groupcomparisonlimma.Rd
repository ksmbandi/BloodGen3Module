% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Groupcomparisonlimma.R
\name{Groupcomparisonlimma}
\alias{Groupcomparisonlimma}
\title{Group comparison analysis using limma}
\usage{
Groupcomparisonlimma(
  data.matrix,
  sample_info = sample_info,
  FC = NULL,
  pval = NULL,
  FDR = TRUE,
  Group_column = NULL,
  Test_group = "Test_group",
  Ref_group = "Control"
)
}
\arguments{
\item{data.matrix}{Matrix of normalized expression data (not Log2 transformed). Genes should be in rows and Sample ID in columns.Row names are required to be valid Gene Symbols}

\item{sample_info}{A dataframe with sample annotation.}

\item{FC}{Numeric value specifying the foldchange cut off that will be applied to define increase or decrease of a given transcript compared to the reference group}

\item{pval}{Numeric value specifying p-value cut off or False discovery rate when FDR = TRUE}

\item{FDR}{Logical operator  to specify whether False discovery rate cut off (using BH-method) should be used}

\item{Group_column}{Character vector identical to the column name from sample_info dataframe that specifies group annotation used for the analysis}

\item{Test_group}{Character vector specifying value within the group column that will be used as Test group}

\item{Ref_group}{Character vector specifying value within the group column that will be used as Reference group}
}
\value{
\preformatted{         A matrix of the percentahe of module response in each group comparison
}
}
\description{
The Groupcomparisonlimma function will perform group comparison analyses using "limma" function from "limma R package" and the results are expressed “at the module level” as percent of genes increased or decreased.
\itemize{
\item Expression matrix and sample annotation files are required to perform this analysis.
\item The sample annotation file must be loaded using a specific name = "sample_info".
\item The names of the columns for the conditions used in the analysis must be specified.
}
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
Group_limma <- Groupcomparisonlimma(data.matrix, sample_info = sample_ann,
FC = 1.5, pval = 0.1, FDR = TRUE, Group_column = "Group_test",
Test_group = "Test", Ref_group = "Control")
}
\author{
Darawan Rinchai \href{mailto:drinchai@gmail.com}{drinchai@gmail.com}
}
