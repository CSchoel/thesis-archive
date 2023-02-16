# Dissertation archive of C. Schölzel

This archive contains all datasets, code and analyses that I created during my PhD thesis and that were not already published elsewhere.

Where third-party rights are involved, I link to private repositories at my working group, which can be accessed upon request to [Prof. Dr. Andreas Dominik](https://www.thm.de/mni/andreas-peter-dominik).
For the case that these repositories are no longer available in the future, I also keep a private copy of them myself.

Some parts are still marked as TODO, which means that the files are not yet uploaded to this repository or not fully described.

## Data

### Model Parameters and variables

* `data/Healthy_range_for_HRV_measures.fods`: References for which value ranges of HRV measures are to be considered "normal" for a healthy population.
* `data/SHM_parameters.fods`: Parameter names and values in SHM across various different papers and implementations.
* `data/HodgkinHuxley_Performance_Matlab_JSim_Modelica.fods`: Performance comparison between Matlab, JSim and Modelica using freely available and or own implementations of the Hodgkin-Huxley model.
  * Modelica implementation: [HHMono (C. Schölzel)](https://github.com/CSchoel/hh-modelica/blob/e84713a4a15bfcc5736755940e6af38bb6272521/HHmodelica/CompleteModels/HHmono.mo)
  * JSim implementation: `code/reference_models/hodgkin_huxley/jsim` (J. B. Bassingthwaighte)
  * CellML implementation (OpenCOR): [Physiome Repository](https://models.physiomeproject.org/workspace/hodgkin_huxley_1952) (Catherine Lloyd, changeset a49243bad279)
  * MATLAB and Octave implementations: `git@magrathea.mni.thm.de:2016-ilgen-biomodels.git` (Denis Ilgen, [see below](#preliminary-studies-performed-by students))
* `data/Inada_compare_equations_and_parameters.fods`: Detailed list of all parameters and equations of the Inada2009 model, comparing the C++, CellML, and Modelica implementations.

### Small research studies performed for papers

#### InaMo

* `data/inamo/reproducibility_suggestions_literature.fods`: Overview of suggestions for increasing reproducibility given by researchers in the literature
* `data/inamo/inada_citations.fods`: Literature research to count number of research groups that reused Inada2009 model for simulations.
* `data/inamo/inada_work_items.fods`: Estimation of time required for implementing InaMo split into different phases.

### Dissertation

* `data/diss/dde_sde_support.fods`: Overview of support for Stochastic Differential Equations (SDE) and Delay Differential Equations (DDE) in different modeling languages.
* `data/diss/language_popularity.fods`: Estimation of modeling language popularity in systems biology by counting papers that match keywords.
* `data/diss/modelica_association.fods`: Statistics about members of the Modelica Association (research vs industry).
* `data/diss/modelica_community_size.fods`: Numbers to estimate the size of the developer communities of Modelica and SBML/CellML.
* `data/diss/SBML_comp_support.fods`: Numbers about support of the SBML-comp package.

## Plots

### Result plots saved for laboratory notebook

TODO: results

## Code

### Jupyter notebook: Power of frequency bands

The notebook in `code/notebooks/PSD of frequency bands.ipynb` contains my learning notes about what the power spectral density (PSD) of a HRV signal is and how it can be computed and interpreted.

### Preliminary studies performed by students

For these projects, you need access to [Magrathea](https://magrathea.mni.thm.de/), the internal Redmine instance used by the working group of Prof. Dr. Andreas Dominik.
If you are interested in this work, please either contact Prof. Dominik or me via mail.

* [MATLAB implementations of Hodgkin-Huxley (1952), Noble (1962), and Inada (2009) models by Dennis Ilgen](https://magrathea.mni.thm.de/projects/ilgen-matlab-biomodels/repository/2016-ilgen-biomodels/revisions/master/show)
* [Modelica implementation of Noble (1962) model by Peter Koch](https://magrathea.mni.thm.de/projects/oertel-koch-modelica-biomodels/repository/2016-oertel-koch-biomodels/revisions/master/show)
* [MATLAB and Modelica implementations of Inada (2009) model by Elias Kupferschmitt](https://magrathea.mni.thm.de/projects/kupferschmitt-inada2009/repository/2019-kupferschmitt-inada2009/revisions/master/show)
* [Automatic conversion between Modelica code and JSim/CellML with Scala by Rodney Tabernero](https://magrathea.mni.thm.de/projects/2019-tabernero-jsim2modelica)
* Java version of the Kotani variant of the Seidel-Herzel model by Daniel Otto with updates by me and Valeria Blesisus (git clone `git@magrathea.mni.thm.de:2014-kotani-CS-VE.git`)


### Comparison between output of Java and Modelica versions of the Kotani variant of the SHM

* Plotting code can be found in `code/compare_kotani_modelica/rscripts`.
* Data for the Modelica version is in `code/compare_kotani_modelica/kotani_full_res.csv`.
* Data for the Java version is in `code/compate_kotani_modelica/silicon000.phi`.

### Early Modelica models

The folder `code/early_models` contains early experiments with Modelica:

* `first_steps`: First steps with Modelica using a Notebook and the Lotka-Volterra model.
* `HackVolterra`: Small Lotka-Volterra example to explain Modelica to students at the THM-MNI Hack.a.day conference.
* `ISA`: Lotka-Volterra-example and example problems for a presentation at the institute for software architecture (ISA) at the THM.
* `LotkaVolterra2`: Early Lotka-Volterra example that I used to test Modelica functionality.
* `MAPK`: First version of a mitogen-activated protein kinase (MAPK) model example that I used to understand modular modeling with Modelica at a larger scale than Lotka-Volterra.
* `MAPKExp`: Second version of the second version of the MAPK model with a reduced number of connectors and better code reuse.
* `MapleMopdel`: Experiments with MapleSoft using basic electrical circuits.
* `SawToothTest`: Early experiments with Modelica for creating a saw tooth signal.
* `LotkaVolterra-thesis`: Lotka-Volterra model that is used in my PhD thesis to illustrate the syntax of Modelica.

#### BioModels analysis

TODO: code/biomodels-analyse

Note: Without data, but with Readme explaining how data was obtained


### Guidelines

TODO: code/guidelines

Unfinished set of examples that should serve as examples of what (not) to do when implementing a model in Modelica

### OMEdit-Docker

TODO: code/omedit-docker

Experiments with Docker to quickly run different OMEdit version

### Import analysis

TODO: code/pmr-import-analyse

Data analysis of PMR models using Python script

### Broadening

* `code/plots/broadening`: Python script to plot broadening function of SHM.
* first_steps

### Metascholar

TODO code/scripts/metascholar

Ruby script to find journals that a list of author typically publishes in through GoogleScholar

### Phase effectiveness

TODO code/scripts/phase_effectivenis

Processing script to understand the phase effectiveness curve in the SHM

### Kotani Plotting

TODO: code/scripts/plotting

Plots to understand functions of the Kotani model

### Svg2Modelica

TODO: code/scripts/svg2modelica

Early work on what would become MoNK prior to MoVE

### Tissue

TODO: code/scripts/tissue

Small python plot to generate image for presentation (probably?)

### Seidel-orig

TODO: code/seidel-orig

Original C-code by Seidel with some changes by me to run tests

-> only publish internally

### TSRR-Paper

TODO: code/TSRR-Paper

Helper plots for discussion about TSRR-Paper

## Notes

### Study of *Cardiovascular physiology concepts*

As part of my preparation for the PhD thesis, I worked through the following text book from start to finish:

Klabunde, R.E. (2012). Cardiovascular physiology concepts (Philadelphia, Pennsylvania: Lippincott Williams & Wilkins).

I took notes in the form of a large mindmap which was generated with [Docear](https://docear.org/) and contains vector graphic images which I created myself and published in the [svgap](https://github.com/CSchoel/svgap) project.

* `notes/cpc/Heart.mm` - Main mindmap file
* `notes/cpc/images` - Image files referenced in Mindmap
* `notes/cpc/images/origins.md` - Lists origin of images that I did not create myself
* `notes/cpc/images/animations` - Contains SVG animations of the ion channel states during an action potential, also published separately as [svgap](https://github.com/CSchoel/svgap).

### Early studies of the Kotani models and the SHM

TODO: kotani-for-dummies, project paper, shm-formulas

## Slides

TODO: Vorträge und Veröffentlichungen

### Conference slides

Conference slides and raw LaTeX versions of all papers can be found on Magrathea, the internal Redmine instance used by the working group of Prof. Dr. Andreas Dominik. under the project name [2014-schoelzel-paper](https://magrathea.mni.thm.de/projects/schoelzel-modelica-sysbio/repository/2014-schoelzel-paper).
