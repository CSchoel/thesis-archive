# Dissertation archive of C. Schölzel

This archive contains all datasets, code and analyses that I created during my PhD thesis and that were not already published elsewhere.

Where third-party rights are involved, I link to private repositories at my working group, which can be accessed upon request to [Prof. Dr. Andreas Dominik](https://www.thm.de/mni/andreas-peter-dominik).
For the case that these repositories are no longer available in the future, I also keep a private copy of them myself.

Some parts are still marked as TODO, which means that the files are not yet uploaded to this repository or not fully described.

## Data

### Model Parameters and variables

* `data/Healthy_range_for_HRV_measures.fods`: References for which value ranges of HRV measures are to be considered "normal" for a healthy population.
  * Reference name in lab notebook: `Notizen/Normal_Values.ods`
* `data/SHM_parameters.fods`: Parameter names and values in SHM across various different papers and implementations.
  * Reference name in lab notebook: `Notizen/Parameters.ods`
* `data/HodgkinHuxley_Performance_Matlab_JSim_Modelica.fods`: Performance comparison between Matlab, JSim and Modelica using freely available and or own implementations of the Hodgkin-Huxley model.
  * Reference name in lab notebook: `Notizen/Performance_Matlab_JSim_Modelica.ods`
  * Modelica implementation: [HHMono (C. Schölzel)](https://github.com/CSchoel/hh-modelica/blob/e84713a4a15bfcc5736755940e6af38bb6272521/HHmodelica/CompleteModels/HHmono.mo)
  * JSim implementation: `code/reference_models/hodgkin_huxley/jsim` (J. B. Bassingthwaighte)
  * CellML implementation (OpenCOR): [Physiome Repository](https://models.physiomeproject.org/workspace/hodgkin_huxley_1952) (Catherine Lloyd, changeset a49243bad279)
  * MATLAB and Octave implementations: `git@magrathea.mni.thm.de:2016-ilgen-biomodels.git` (Denis Ilgen, not publicly available)
* `data/Inada_compare_equations_and_parameters.fods`: Detailed list of all parameters and equations of the Inada2009 model, comparing the C++, CellML, and Modelica implementations.
  * Reference name in lab notebook: `Notizen/InadaCompareEquationsAndParameters.ods`

### Small research studies performed for Papers

#### InaMo

* `data/inamo/reproducibility_suggestions_literature.fods`: Overview of suggestions for increasing reproducibility given by researchers in the literature
  * Reference name in lab notebook: `2020-InaMo/Reproducibility.ods`
* 

TODO: Papers/eigenes/*.f?ods

## Plots

### Result plots saved for laboratory notebook

TODO: results

## Code

### Jupyter notebook: Power of frequency bands

TODO: Notizen/PSD of frequency bands.ipynb

### Preliminary studies performed by students

For these projects, you need access to [Magrathea](https://magrathea.mni.thm.de/), the internal Redmine instance used by the working group of Prof. Dr. Andreas Dominik.
If you are interested in this work, please either contact Prof. Dominik or me via mail.

* [MATLAB implementations of Hodgkin-Huxley (1952), Noble (1962), and Inada (2009) models by Dennis Ilgen](https://magrathea.mni.thm.de/projects/ilgen-matlab-biomodels/repository/2016-ilgen-biomodels/revisions/master/show)
* [Modelica implementation of Noble (1962) model by Peter Koch](https://magrathea.mni.thm.de/projects/oertel-koch-modelica-biomodels/repository/2016-oertel-koch-biomodels/revisions/master/show)
* [MATLAB and Modelica implementations of Inada (2009) model by Elias Kupferschmitt](https://magrathea.mni.thm.de/projects/kupferschmitt-inada2009/repository/2019-kupferschmitt-inada2009/revisions/master/show)
* [Automatic conversion between Modelica code and JSim/CellML with Scala by Rodney Tabernero](https://magrathea.mni.thm.de/projects/2019-tabernero-jsim2modelica)


#### BioModels analysis

TODO: code/biomodels-analyse

Note: Without data, but with Readme explaining how data was obtained

### HackVolterra

TODO: code/eclipse-old/HackADay/HackVolterra

Small Lotka-Volterra example to explain Modelica to students

### ISA presentation

TODO: code/eclipse-old/ISA-Vortrag

Lotka-Volterra-example and example problems

### LotkaVolterra2

TODO: code/eclipse-old/LotkaVolterra2

Lotka-Volterra example for my own tests

### MAPK

TODO: code/eclipse-old/MAPK

First version of map kinase casade example

TODO: code/eclipse-old/MAPKExp

second version of MAPK (find out what changed)

### MapleModel

TODO: code/eclipse-old/MapleModel

experiments with MapleSoft

### SawToothTest

TODO: code/eclipse-old/SawToothTest

early experiments with Modelica

### SHM1

TODO: code/eclipse-old/shm1-vali

Work from me and valeria on Java implementation of Kotani

### First steps

TODO: code/first steps

First steps with Modelica using a Notebook

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

TODO: code/scripts/broadening

Python script to plot broadening function

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

As part of my preparation for the PhD thesis, I read the following book:

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
