#' @title vcftools Individual Filters
#'
#' @description These functions filter out individuals based on the arguments
#'     provided. Input and results file names should include the path, but no
#'     extension. Functions return the numbers of individuals and loci kept after
#'     filtering.
#'
#' @param vcf.fn character string with the relative path and name of the vcf file to be filtered
#' @param res.fn character string with the relative path and name of the output vcf file
#' @param ind.file.name name of file listing individuals to be removed
#'
#' @return two character strings stating 1) the number of individuals filtered
#'     out and 2) the number of loci filtered out
#' @export
#'
vcftools.removeInd <- function(vcf.fn, res.fn, ind.file.name){
  output <- system2(command = "vcftools",
                    args = c("--vcf ", paste0(vcf.fn, ".vcf"), "--out ", res.fn,
                             "--remove", ind.file.name, "--recode", "--recode-INFO-all"),
                    stdout = TRUE, stderr = TRUE)
  return(c(output[length(output)-3],output[length(output)-1]))
}
