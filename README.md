# About

This repo [awesome-AI4EDA](https://github.com/ai4eda/awesome-AI4EDA) contains the source for the webpage: [https://ai4eda.github.io](https://ai4eda.github.io), which is a curated paper list of awesome AI for EDA.

It can **automatically** render the plain `bibtex` file into `html` for display on the webpage.



## Example

`bibtex` -> `html`

![Bibtex2Html](/images/bibtex2html.png)


<br/>

# How to contribute / add my publications?

By email or By github PR.

## Method 1: send your `bibtex` to Guojin Chen by email [cgjcuhk@gmail.com](cgjcuhk@gmail.com)


### `bibtex` format
Following this format. Example: 👇🏻

**Required Fields**

The `title`, `author`, `_venue`, and `year` Fields are required. You publication will be displayed into the corresponding topic.


**Optional Fields**

You can also add `url` or `link` field to attach the paper link.

Add the `abstract` field to show the paper abstract.

Add the `topic` field as a topic.

Add the `code_url`, `slides_url`, `video_url`, `talk_url`, `project_url` field for link to your codes, slides, video, talks, or project pages.

```txt
@inproceedings{DAC23_Nitho,
  title={Physics-Informed Optical Kernel Regression Using Complex-valued Neural Fields},
  author={Chen, Guojin and Pei, Zehua and Yang, Haoyu and Ma, Yuzhe and Yu, Bei and Wong, Martin},
  booktitle={ACM/IEEE Design Automation Conference,  (\textbf{DAC '23})},
  _venue={DAC},                              # Required field,
  year={2023},                               # Required field,
  url = {link to your paper},                # Optional field,
  topic = {topic of your paper}              # Optional field,
  abstract = {abstract of your paper},       # Optional field,
  code_url = {link to your codes},           # Optional field,
  slides_url = {link to your slides},        # Optional field,
  talk_url = {link to your talk video},      # Optional field,
  video_url = {link to your video},          # Optional field,
  project_url = {link to your project page}, # Optional field,
}
```

>🚧 Warning
>
>1. You should separate the names in `author` field with **"and"**.

<br/>
<br/>

## Method 2: Submit a github PR to [https://github.com/ai4eda/awesome-AI4EDA](https://github.com/ai4eda/awesome-AI4EDA)



### Step 1: Add your `bibtex` file to `./publications/***.bib`

We provide different categories according to the EDA flow, please copy your bibtex to the corresponding category.

The categories are defined in `pub.yaml` of repo: [awesome-AI4EDA](https://github.com/ai4eda/awesome-AI4EDA), you can also submit new categories to `pub.yaml` or contact [cgjcuhk@gmail.com](mailto:cgjcuhk@gmail.com) to help you add the categories.

```yaml
# pub.yaml
categories_publications:
  name: "All publications"
  categories:
    -
      heading: "High Level Synthesis"
      file: hls.bib
    -
      heading: "Logic Synthesis"
      file: logicSyn.bib
    -
      heading: "Circuit Verification"
      file: circuit.bib
    -
      heading: "Placement"
      file: place.bib
    -
      heading: "Clock Tree Synthesis"
      file: CTS.bib
    -
      heading: "Routing"
      file: routing.bib
    -
      heading: "Timing"
      file: timing.bib
    -
      heading: "Layout Verification"
      file: layoutVer.bib
    -
      heading: "Mask Optimization"
      file: opc.bib
    -
      heading: "Analog Layout Synthesis"
      file: analog.bib
    -
      heading: "Dataset and Tools"
      file: data.bib
```


### Step 2: Add the topic for your pub in the bibtex file.

Follow the `bibtex` format above. Add your `bibtex` to the corresponding file.

### Step3: Submit a PR  or email to Guojin Chen ([cgjcuhk@gmail.com](mailto:cgjcuhk@gmail.com))

Submit a PR to repo: [awesome-AI4EDA](https://github.com/ai4eda/awesome-AI4EDA).

Or send your plain text `bibtex` to Guojin Chen ([cgjcuhk@gmail.com](mailto:cgjcuhk@gmail.com))

Thank you.




## How this work

<details>
<Summary>Toggle to see how this work</Summary>

+ [generate.py](generate.py) creates a [website](http://ai4eda.github.io) from a shared [YAML source](pub.yaml) by using Jinja templates.

+ The publications are rendered from a single
  [BibTeX](publications/all.bib) file.
  The abstracts are displayed in the website output
  and the selected publications here are highlighted.
+ The [YAML source](pub.yaml) links to all author websites,
  which will automatically be added to the
  publication lists in the website and PDF.
+ GitHub stars are automatically scraped and cached on disk.


### Building and running
Dependencies are included in `requirements.txt` and can be installed
using `pip` with `pip3 install -r requirements.txt`.
`make` will call [generate.py](generate.py) and
build the LaTeX documents with `latexmk` and `biber`.
The Makefile can also:

1. Stage to my website with `make stage`,
2. Start a local jekyll server of my website with updated
    documents with `make jekyll`, and
3. Push updated documents to my website with `make push`.

### What to modify
Change the content in `pub.yaml`.
You should also look through the template files to make sure there isn't any
special-case code that needs to be modified.
The `Makefile` can also start a Jekyll server and push the
new documents to another repository with `make jekyll` and `make push`.

</details>

## Warnings
1. Strings in `pub.yaml` should be LaTeX (though, the actual LaTeX formatting
   should be in the left in the templates as much as possible).
2. If you do include any new LaTeX commands, make sure that one of the
   `REPLACEMENTS` in `generate.py` converts them properly.
3. The LaTeX templates use modified Jinja delimiters to avoid overlaps with
   normal LaTeX. See `generate.py` for details.
