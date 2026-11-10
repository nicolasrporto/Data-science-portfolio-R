# Classificação de Asteroides Perigosos com Random Forest ☄️

Este projeto aplica algoritmos de Machine Learning para a identificação e classificação de asteroides potencialmente perigosos (PHAs - Potentially Hazardous Asteroids) utilizando a linguagem **R**. 

A classificação é baseada em características físicas e orbitais dos objetos celestes, utilizando o modelo **Random Forest** para prever se um asteroide representa ou não uma ameaça à Terra.

## 🚀 Objetivo do Projeto
Transformar dados astronômicos brutos e normalizados em um modelo preditivo robusto. O foco principal é a correta identificação de ameaças espaciais através de uma abordagem estatística estruturada, avaliando a otimização de hiperparâmetros gerada pelo algoritmo.

## 🛠️ Tecnologias e Pacotes Utilizados
* **Linguagem:** R
* **Ambiente:** Jupyter Notebook / Google Colab
* **Principais Pacotes:**
  * `caret`: Utilizado para a partição estratificada dos dados, treinamento e tunagem do modelo.
  * `randomForest`: Algoritmo base para a construção do modelo de classificação por florestas aleatórias.
  * `ggplot2` / `lattice`: Renderização de gráficos e análise visual de performance.

## 📊 Metodologia Aplicada
1. **Pré-processamento:** Normalização das variáveis preditoras (`parametros_norm`) para garantir consistência dimensional.
2. **Divisão de Dados:** Partição estratificada mantendo a proporção das classes, separando **75% dos dados para treinamento** e **25% para teste**.
3. **Treinamento:** Ajuste do modelo Random Forest cross-validado por meio da interface do pacote `caret`.
4. **Avaliação:** Análise gráfica do impacto do número de preditores selecionados aleatoriamente (`mtry`) na acurácia do modelo.

## 📂 Como Executar
1. Certifique-se de ter o R ou um ambiente baseado em Jupyter/Google Colab configurado.
2. Instale as dependências necessárias executando no seu console R:
   ```R
   install.packages(c("caret", "randomForest", "ggplot2"))
   ```
3. Abra o arquivo correspondente ao notebook e execute as células sequencialmente.
