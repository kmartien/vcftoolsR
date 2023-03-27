#' Title vcftools Summary Functions
#'
#' @description These functions filter calculate summary info for individuals and
#'     loci. Input and results file names should include the path, but no
#'     extension.
#'
#' @param vcf.fn character string with the relative path and name of the vcf file to be filtered
#' @param res.fn character string with the relative path and name of the output vcf file
#'
#' @return
#' @export
#'

# depth indv/locus
vcftools.idepth <- function(vcf.fn, res.fn){
  system2(command = "vcftools", args = c("--vcf ", paste0(vcf.fn,".vcf"), "--out", res.fn, "--depth"),
          stdout = FALSE)
}

#' @rdname vcftools.idepth
vcftools.siteDepth <- function(vcf.fn, res.fn){
  system2(command = "vcftools", args = c("--vcf ", paste0(vcf.fn,".vcf"), "--out", res.fn, "--site-mean-depth"),
          stdout = FALSE)
}

#' @rdname vcftools.idepth
vcftools.genoDepth <- function(vcf.fn, res.fn){
  system2(command = "vcftools", args = c("--vcf ", paste0(vcf.fn,".vcf"), "--out", res.fn, "--geno-depth"),
          stdout = FALSE)
}

# missing data indv/locus
#' @rdname vcftools.idepth
vcftools.imiss <- function(vcf.fn, res.fn){
  system2(command = "vcftools", args = c("--vcf ", paste0(vcf.fn,".vcf"), "--out", res.fn, "--missing-indv"),
          stdout = FALSE)
}

#' @rdname vcftools.idepth
vcftools.siteMiss <- function(vcf.fn, res.fn){
  system2(command = "vcftools", args = c("--vcf ", paste0(vcf.fn,".vcf"), "--out", res.fn, "--missing-site"),
          stdout = FALSE)
}

# allele freq/indv freq buden
#' @rdname vcftools.idepth
vcftools.freqBurden <- function(vcf.fn, res.fn){
  system2(command = "vcftools", args = c("--vcf ", paste0(vcf.fn,".vcf"), "--out", res.fn, "--indv-freq-burden"),
          stdout = FALSE)
}

#' @rdname vcftools.idepth
vcftools.freq2 <- function(vcf.fn, res.fn){
  system2(command = "vcftools", args = c("--vcf ", paste0(vcf.fn,".vcf"), "--out", res.fn, "--freq2"),
          stdout = FALSE)
}

#' @rdname vcftools.idepth
vcftools.singletons <- function(vcf.fn, res.fn){
  system2(command = "vcftools", args = c("--vcf ", paste0(vcf.fn,".vcf"), "--out", res.fn, "--singletons"),
          stdout = FALSE)
}

#' @rdname vcftools.idepth
vcftools.012 <- function(vcf.fn, res.fn){
  system2(command = "vcftools", args = c("--vcf ", paste0(vcf.fn,".vcf"), "--out", res.fn, "--012"),
          stdout = FALSE)
}

# heterozygosity per individual
#' @rdname vcftools.idepth
vcftools.het <- function(vcf.fn, res.fn){
  system2(command = "vcftools", args = c("--vcf ", paste0(vcf.fn,".vcf"), "--out", res.fn, "--het"),
          stdout = FALSE)
}
# SNP call quality
#' @rdname vcftools.idepth
vcftools.siteQual <- function(vcf.fn, res.fn){
  system2(command = "vcftools", args = c("--vcf ", paste0(vcf.fn,".vcf"), "--out", res.fn, "--site-quality"),
          stdout = FALSE)
}
