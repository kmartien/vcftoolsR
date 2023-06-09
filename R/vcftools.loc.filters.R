#' @title vcftools Locus Filters
#'
#' @description These functions filter out loci or genotypes based on the arguments
#'     provided. Input and results file names should include the path, but no
#'     extension. Functions return the numbers of individuals and loci kept after
#'     filtering.
#'
#' @param vcf.fn character string with the relative path and name of the vcf file to be filtered
#' @param res.fn character string with the relative path and name of the output vcf file
#' @param minDP minimum read depth below which a genotype should be removed
#' @param minQ minimum quality below which genotype should be removed
#' @param meanDP minimum mean read depth below which loci should be removed
#' @param mac minimum minor allele count below which the minor allele should not be called
#' @param max.reads maximum number of reads above which a locus is removed
#' @param max.miss maximum number of missing reads per individual below which
#'     loci should be removed
#' @param CHROM.POS.file.name character string naming a file with names of CHROM and POS to remove
#'
#' @return two character strings stating 1) the number of individuals filtered
#'     out and 2) the number of loci filtered out
#' @export
#'
vcftools.minDP <- function(vcf.fn, res.fn, minDP){
  output <- system2(command = "vcftools",
                    args = c("--vcf ", paste0(vcf.fn, ".vcf"), "--out ", res.fn,
                             "--minDP ", minDP, "--recode", "--recode-INFO-all"),
                    stdout = TRUE, stderr = TRUE)
  return(c(output[length(output)-3],output[length(output)-1]))
}

#' @rdname vcftools.minDP
vcftools.minQ <- function(vcf.fn, res.fn, minQ){
  output <- system2(command = "vcftools",
                    args = c("--vcf ", paste0(vcf.fn, ".vcf"), "--out ", res.fn,
                             "--minQ ", minQ, "--recode", "--recode-INFO-all"),
                    stdout = TRUE, stderr = TRUE)
  return(c(output[length(output)-3],output[length(output)-1]))
}

#' @rdname vcftools.minDP
vcftools.meanDP <- function(vcf.fn, res.fn, meanDP){
  output <- system2(command = "vcftools",
                    args = c("--vcf ", paste0(vcf.fn, ".vcf"), "--out ", res.fn,
                             "--min-meanDP ", meanDP, "--recode", "--recode-INFO-all"),
                    stdout = TRUE, stderr = TRUE)
  return(c(output[length(output)-3],output[length(output)-1]))
}

#' @rdname vcftools.minDP
vcftools.mac <- function(vcf.fn, res.fn, mac){
  output <- system2(command = "vcftools",
                    args = c("--vcf ", paste0(vcf.fn, ".vcf"), "--out ", res.fn,
                             "--mac", mac, "--recode", "--recode-INFO-all"),
                    stdout = TRUE, stderr = TRUE)
  return(c(output[length(output)-3],output[length(output)-1]))
}

#' @rdname vcftools.minDP
vcftools.monomorphic <- function(vcf.fn, res.fn){
  output <- system2(command = "vcftools",
                    args = c("--vcf ", paste0(vcf.fn, ".vcf"), "--out ", res.fn,
                             "--min-alleles", "2", "--recode", "--recode-INFO-all"),
                    stdout = TRUE, stderr = TRUE)
  return(c(output[length(output)-3],output[length(output)-1]))
}

#' @rdname vcftools.minDP
vcftools.excessReads <- function(vcf.fn, res.fn, max.reads){
  output <- system2(command = "vcftools",
                    args = c("--vcf ", paste0(vcf.fn, ".vcf"), "--out ", res.fn,
                             "--max-meanDP", max.reads, "--recode", "--recode-INFO-all"),
                    stdout = TRUE, stderr = TRUE)
  return(c(output[length(output)-3],output[length(output)-1]))
}

#' @rdname vcftools.minDP
vcftools.removeIndels <- function(vcf.fn, res.fn){
  output <- system2(command = "vcftools",
                    args = c("--vcf ", paste0(vcf.fn, ".vcf"), "--out ", res.fn,
                             "--remove-indels", "--recode", "--recode-INFO-all"),
                    stdout = TRUE, stderr = TRUE)
  return(c(output[length(output)-3],output[length(output)-1]))
}

#' @rdname vcftools.minDP
vcftools.maxMiss <- function(vcf.fn, res.fn, max.miss){
  output <- system2(command = "vcftools",
                    args = c("--vcf ", paste0(vcf.fn, ".vcf"), "--out ", res.fn,
                             "--max-missing", max.miss, "--recode", "--recode-INFO-all"),
                    stdout = TRUE, stderr = TRUE)
  return(c(output[length(output)-3],output[length(output)-1]))
}

#' @rdname vcftools.minDP
vcftools.rmPOS <- function(vcf.fn, res.fn, CHROM.POS.file.name){
  output <- system2(command = "vcftools",
                    args = c("--vcf ", paste0(vcf.fn, ".vcf"), "--out ", res.fn,
                             "--exclude-positions", CHROM.POS.file.name, "--recode", "--recode-INFO-all"),
                    stdout = TRUE, stderr = TRUE)
  return(c(output[length(output)-3],output[length(output)-1]))
}
