# Classificação de Dígitos Manuscritos com Redes Neurais (MNIST) em R 🧠🔢

Este projeto aplica conceitos práticos de **Redes Neurais Artificiais (MLP - Multi-Layer Perceptrons)** para resolver o clássico problema de reconhecimento de dígitos manuscritos utilizando o dataset **MNIST** e a biblioteca **Keras** integrada ao ecossistema **R**.

O objetivo principal do experimento é analisar como a **profundidade da rede** (número de camadas) e a **largura da rede** (número de neurônios por camada) impactam a acurácia final e o tempo de treinamento do modelo.

---

## 🚀 Objetivos do Projeto
* **Exploração de Arquiteturas:** Avaliar o comportamento de redes neurais variando a capacidade computacional das camadas ocultas (32, 64 e 512 neurônios).
* **Análise Comparativa:** Mensurar o ganho de acurácia em relação ao custo de tempo de processamento (`Sys.time()`) ao empilhar camadas ocultas (redes profundas vs. redes rasas).
* **Otimização:** Aplicar e compreender o funcionamento do otimizador `RMSprop` e da função de perda `Categorical Crossentropy`.

---

## 🛠️ Tecnologias e Dependências
* **Linguagem:** R
* **Framework de Deep Learning:** `Keras` (com backend TensorFlow)
* **Visualização de Dados:** Funções gráficas nativas do R (`image`, `par`, `plot`)

---

## 📊 Metodologia e Modelos Testados

O dataset MNIST foi dividido no padrão clássico de mercado: **60.000 imagens para treino** e **10.000 imagens para teste**. Cada imagem possui a dimensão de 28x28 pixels em escala de cinza.

Foram construídas e comparadas 4 arquiteturas diferentes:

1. **Modelo Raso (32 Neurônios):** Uma única camada oculta de 32 unidades (Ativação ReLU).
2. **Modelo Raso (64 Neurônios):** Uma única camada oculta de 64 unidades (Ativação ReLU).
3. **Modelo Profundo Simétrico:** Duas camadas ocultas consecutivas com 64 neurônios cada.
4. **Modelo de Alta Capacidade:** Três camadas ocultas profundas (uma inicial de 512 neurônios seguida por duas de 64 neurônios).

---

## 💻 Estrutura do Código Principal

O fluxo de desenvolvimento segue a estrutura padrão de projetos de Deep Learning:

```R
# 1. Carregamento e Visualização dos Dados Brutos
mnist <- dataset_mnist()
# [... Pré-processamento e engenharia de recursos ...]

# 2. Definição da Arquitetura (Exemplo: Modelo Profundo)
modelo2 <- keras_model_sequential() %>%
  layer_dense(units = 64, activation = "relu", input_shape = c(784)) %>%  
  layer_dense(units = 64, activation = "relu") %>% 
  layer_dense(units = 10, activation = "softmax") 

# 3. Compilação do Modelo
modelo2 %>% compile(
  optimizer = "rmsprop",
  loss = "categorical_crossentropy",
  metrics = c("accuracy")
)

# 4. Treinamento e Monitoramento de Performance
t0 = Sys.time()
historia <- modelo2 %>% fit(
  train_images, train_labels, 
  epochs = 10, 
  batch_size = 128,
  verbose = 0,
  validation_data = list(test_images, test_labels)
)
plot(historia)
```

---

## 📈 Como Executar o Projeto

1. Certifique-se de ter o ambiente **R** ou **Jupyter/Google Colab** configurado para R.
2. Instale e configure o Keras executando o comando abaixo no console do R:
   ```R
   install.packages("keras")
   library(keras)
   install_keras()
   ```
3. Clone este repositório e execute as células do notebook sequencialmente para visualizar as matrizes de pixels transformadas em imagens e os gráficos de convergência de treino.

---

## 📬 Contato

Desenvolvido por **Nicolas Ribeiro Porto**  
* 🏛️ Estudante na USP (Universidade de São Paulo)  
* 📧 E-mail: nicolasrp@usp.br  
* 🔗 [LinkedIn](https://linkedin.com)
