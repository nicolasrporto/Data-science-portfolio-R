# Estimativa de Redshift Fotométrico e Classificação de Objetos Celestes com S-PLUS em R 🌌🔭

Este repositório contém aplicações práticas de **Machine Learning** voltadas para a **Astrofísica e Cosmologia Observacional**, utilizando a linguagem **R** e o pacote `caret`.

O projeto é focado em processar dados do **S-PLUS (Southern Photometric Local Universe Survey)**, aplicando algoritmos de regressão e classificação (como **Random Forest** e **KNN**) para estimar o redshift fotométrico ($z_{phot}$) e classificar fontes astronômicas (estrelas e galáxias) a partir de suas magnitudes em diferentes bandas de filtros.

---

## 🚀 Objetivos do Projeto
* **Engenharia de Recursos (Feature Engineering):** Calcular e estruturar as cores astronômicas a partir das diferenças de magnitudes das bandas do S-PLUS (filtros `uJAVA`, `F378`, `F395`, `F410`, `F430`, `g`, `F515`, `F660`, `i`, `F861`, `z`, `z_SDSS`) em relação à banda de referência `r_petro`.
* **Regressão com Random Forest:** Treinar e otimizar um modelo regressivo para estimar o redshift observacional com validação cruzada (Bootstrapping com 25 repetições).
* **Classificação com KNN:** Construir um pipeline de classificação supervisionada para separar estrelas de galáxias com base em suas propriedades fotométricas normalizadas.

---

## 🛠️ Tecnologias e Pacotes Utilizados
* **Linguagem:** R
* **Ambiente:** Jupyter Notebook (`ir` kernel) / Google Colab
* **Principais Pacotes:**
  * `caret`: Divisão estratificada dos dados, cross-validation, treinamento e ajuste de hiperparâmetros.
  * `randomForest`: Algoritmo de florestas aleatórias para a regressão do Redshift.
  * `C50` & `knn`: Algoritmos para análise classificatória.
  * `ggplot2`: Visualização de dados e análise de dispersão do modelo.

---

## 📊 Metodologia e Pipelines de Código

### Pipeline 1: Regressão de Redshift Fotométrico (Random Forest)
1. **Normalização:** Centralização e escalonamento (`scale`) das magnitudes fotométricas.
2. **Divisão de Dados:** Partição de **80% para treinamento** (8.002 amostras) e **20% para testes** (2.000 amostras).
3. **Treinamento e Otimização:** O modelo testou diferentes quantidades de preditores selecionados aleatoriamente (`mtry`), encontrando o valor ótimo em `mtry = 6`.

#### Resultados de Validação Cruzada:

| mtry | RMSE | Rsquared ($R^2$) | MAE |
| :---: | :---: | :---: | :---: |
| 2 | 0.1130 | 0.9914 | 0.0636 |
| **6 (Ótimo)** | **0.1013** | **0.9931** | **0.0619** |
| 11 | 0.1035 | 0.9928 | 0.0636 |

```R
# Treinamento do Modelo executado no projeto
model_rf <- train(xtrain, ytrain, method = "rf")
```

### Pipeline 2: Classificação Estrela-Galáxia (KNN)
1. **Análise de Cores:** Geração de gráficos `smoothScatter` para analisar as regiões de cores (ex: $g-r$ vs $r-i$) ocupadas pelas diferentes classes.
2. **Treinamento KNN:** Otimização do hiperparâmetro $k$ avaliado via Cross-Validation em 10 folds, alcançando uma acurácia de teste final de **95.9%** com $k = 5$.

---

## 📈 Resultados Visuais
O projeto gera uma análise de dispersão comparando o redshift observado ($z_{spec}$) com o predito pelo modelo ($z_{phot}$), plotado via `ggplot2` com uma linha de tendência centralizada, comprovando o alto coeficiente de determinação ($R^2 = 0.993$) alcançado pela floresta aleatória.

---

## 📂 Como Executar o Projeto

1. Certifique-se de ter os arquivos de dados locais `.dat` (`splus-mag-z.dat` e `dadosparaestrelagalaxia.dat`) no mesmo diretório do script.
2. Instale as dependências executando no console do R:
   ```R
   install.packages(c("caret", "randomForest", "C50", "ggplot2"))
   ```
3. Abra o arquivo `.ipynb` no Jupyter ou faça o upload para o Google Colab e execute as células.

---

## 📬 Contato

Desenvolvido por **Nicolas Ribeiro Porto**  
* 🏛️ Estudante na USP (Universidade de São Paulo)  
* 📧 E-mail: nicolasrp@usp.br  
* 🔗 [LinkedIn](https://linkedin.com)
