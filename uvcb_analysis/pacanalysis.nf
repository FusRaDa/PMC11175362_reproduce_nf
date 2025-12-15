// This process performs PAC analysis on the provided input data.

// Inputs:
// uvcb_analysis/PACAnalysis_Figure10.R
// uvcb_analysis/1994-House_SupTab4.csv
// uvcb_analysis/qcpheno.out_results.csv
 

// Outputs:
// Figure_10.png


process PAC_ANALYSIS{
    publishDir 'figures', mode: 'symlink'

    conda 'conda_env.yml'

    input:
        path input_script
        path input_csv1
        path input_csv2

    output:
        path "*.png"

    script:
    """
    Rscript ${input_script} ${input_csv1} ${input_csv2}
    """
}