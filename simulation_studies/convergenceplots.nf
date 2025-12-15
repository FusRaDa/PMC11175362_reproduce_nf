// This process generates convergence plots - figure 7

// Inputs (in order):
// simulation_studies/convergenceplots/ConvergencePlots_Figure7.R
// simulation_studies/stats_data/stats50Converge3Bins500SamplesV2.rdata
// simulation_studies/stats_data/stats100Converge3Bins500SamplesV2.rdata
// simulation_studies/stats_data/stats500Converge3Bins500SamplesV2.rdata
// simulation_studies/stats_data/stats1000Converge3Bins500SamplesV2.rdata
// simulation_studies/stats_data/runningTime_sameNode/stats50Converge3Bins500SamplesV2.rdata
// simulation_studies/stats_data/runningTime_sameNode/stats50Converge3Bins1000SamplesV2.rdata
// simulation_studies/stats_data/runningTime_sameNode/stats50Converge3Bins5000SamplesV2.rdata
// simulation_studies/stats_data/runningTime_sameNode/stats50Converge3Bins10000SamplesV2.rdata
// simulation_studies/stats_data/runningTime_sameNode/stats100Converge3Bins500SamplesV2.rdata
// simulation_studies/stats_data/runningTime_sameNode/stats100Converge3Bins1000SamplesV2.rdata
// simulation_studies/stats_data/runningTime_sameNode/stats100Converge3Bins5000SamplesV2.rdata
// simulation_studies/stats_data/runningTime_sameNode/stats100Converge3Bins10000SamplesV2.rdata
// simulation_studies/stats_data/runningTime_sameNode/stats500Converge3Bins500SamplesV2.rdata
// simulation_studies/stats_data/runningTime_sameNode/stats500Converge3Bins1000SamplesV2.rdata
// simulation_studies/stats_data/runningTime_sameNode/stats500Converge3Bins5000SamplesV2.rdata
// simulation_studies/stats_data/runningTime_sameNode/stats500Converge3Bins10000SamplesV2.rdata
// simulation_studies/stats_data/runningTime_sameNode/stats1000Converge3Bins500SamplesV2.rdata
// simulation_studies/stats_data/runningTime_sameNode/stats1000Converge3Bins1000SamplesV2.rdata
// simulation_studies/stats_data/runningTime_sameNode/stats1000Converge3Bins5000SamplesV2.rdata
// simulation_studies/stats_data/runningTime_sameNode/stats1000Converge3Bins10000SamplesV2.rdata


// Outputs:
// Figure_7.png


process CONVERGENCE_PLOTS{
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
        path input_rdata7
        path input_rdata8
        path input_rdata9
        path input_rdata10
        path input_rdata11
        path input_rdata12
        path input_rdata13
        path input_rdata14
        path input_rdata15
        path input_rdata16
        path input_rdata17
        path input_rdata18
        path input_rdata19
        path input_rdata20

    output:
        path "*.png"

    script:
    """
    Rscript ${input_script} \
        --${input_rdata1} \
        --${input_rdata2} \
        --${input_rdata3} \
        --${input_rdata4} \
        --${input_rdata5} \
        --${input_rdata6} \
        --${input_rdata7} \
        --${input_rdata8} \
        --${input_rdata9} \
        --${input_rdata10} \
        --${input_rdata11} \
        --${input_rdata12} \
        --${input_rdata13} \
        --${input_rdata14} \
        --${input_rdata15} \
        --${input_rdata16} \
        --${input_rdata17} \
        --${input_rdata18} \
        --${input_rdata19} \
        --${input_rdata20}
    """
}