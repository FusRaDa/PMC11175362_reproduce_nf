// This process generates MAE plots - figure 8

// Inputs (in order):
// simulation_studies/MAEPlots_Figure8.R
// simulation_studies/MAEData/dists500Converge3Bins500SamplesV2.rdata - loaded 3 times in script
// simulation_studies/MAEData/dists500Converge3Bins1000SamplesV2.rdata
// simulation_studies/MAEData/dists500Converge3Bins5000SamplesV2.rdata
// simulation_studies/MAEData/dists500Converge3Bins10000SamplesV2.rdata
// simulation_studies/MAEData/dists500Converge2Bins500SamplesV2.rdata
// simulation_studies/MAEData/dists500Converge4Bins500SamplesV2.rdata

// Outputs:
// Figure_8.png


process MAE_PLOTS{
    publishDir 'figures', mode: 'symlink'

    conda 'conda_env.yml'

    input:
        path input_script
        path input_rdata1
        path input_rdata2
        path input_rdata3
        path input_rdata4
        path input_rdata5
        path input_rdata6

    output:
        path "*.png"

    script:
    """
    Rscript ${input_script} ${input_rdata1} ${input_rdata2} ${input_rdata3} ${input_rdata4} ${input_rdata5} ${input_rdata6}
    """
}