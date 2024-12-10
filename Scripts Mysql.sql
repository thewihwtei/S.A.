-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS empresa;

-- Seleciona o banco de dados
USE empresa;

-- Tabela de Funcionários
CREATE TABLE IF NOT EXISTS funcionarios (
    id INT AUTO_INCREMENT PRIMARY KEY,        -- Codigo único do funcionário
    nome VARCHAR(255) NOT NULL,               -- Nome do funcionário
    cpf VARCHAR(14) NOT NULL UNIQUE,          -- CPF do funcionário
    telefone VARCHAR(15),                     -- Telefone do funcionário
    endereco VARCHAR(255)                     -- Endereço do funcionário
);

-- Tabela de Clientes
CREATE TABLE IF NOT EXISTS clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,        -- Código único do cliente
    nome VARCHAR(255) NOT NULL,               -- Nome do cliente
    cnpj VARCHAR(18) NOT NULL UNIQUE,         -- CNPJ do cliente
    telefone VARCHAR(15),                     -- Telefone do cliente
    endereco VARCHAR(255)                     -- Endereço do cliente
);

-- Tabela de Fornecedores
CREATE TABLE IF NOT EXISTS fornecedores (
    id INT AUTO_INCREMENT PRIMARY KEY,        -- Código único do fornecedor
    nome VARCHAR(255) NOT NULL,               -- Nome do fornecedor
    cnpj VARCHAR(18) NOT NULL UNIQUE,         -- CNPJ do fornecedor
    telefone VARCHAR(15),                     -- Telefone do fornecedor
    endereco VARCHAR(255)                     -- Endereço do fornecedor
);

-- Tabela de Transportadoras
CREATE TABLE IF NOT EXISTS transportadoras (
    id INT AUTO_INCREMENT PRIMARY KEY,        -- Código único da transportadora
    nome VARCHAR(255) NOT NULL,               -- Nome da transportadora
    cnpj VARCHAR(18) NOT NULL UNIQUE,         -- CNPJ da transportadora
    telefone VARCHAR(15),                     -- Telefone da transportadora
    endereco VARCHAR(255)                     -- Endereço da transportadora
);



-- Tabela de Categorias de Produtos
CREATE TABLE IF NOT EXISTS categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,        -- Código único da categoria
    nome VARCHAR(50) NOT NULL                 -- Nome da categoria (Vedações, Conexões, etc.)
);

-- Inserção das categorias padrões
INSERT INTO categorias (nome) VALUES ('Vedações'), ('Conexões'), ('Válvulas'), ('Visores');

-- Tabela de Produtos
CREATE TABLE IF NOT EXISTS produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,        -- Código único do produto
    nome VARCHAR(255) NOT NULL,               -- Nome do produto
    valor DECIMAL(10, 2) NOT NULL,            -- Valor do produto
    categoria_id INT,                         -- Categoria do produto (FK)
    FOREIGN KEY (categoria_id) REFERENCES categorias(id)  -- Relacionamento com a tabela categorias
);

-- Tabela de Pedidos (agora com nomes ao invés de IDs)
CREATE TABLE IF NOT EXISTS pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,        -- Código único do pedido
    cliente_nome VARCHAR(255) NOT NULL,        -- Nome do cliente
    produto_nome VARCHAR(255) NOT NULL,        -- Nome do produto
    valor_unitario DECIMAL(10, 2) NOT NULL,    -- Valor unitário do produto no pedido
    quantidade INT NOT NULL,                   -- Quantidade de produtos no pedido
    valor_total DECIMAL(10, 2) NOT NULL,       -- Valor total do pedido (valor_unitario * quantidade)
    transportadora_nome VARCHAR(255) NOT NULL, -- Nome da transportadora
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Data do pedido
);

-- Tabela de Usuários (para login e registro)
CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,          -- Código único do usuário
    usuario VARCHAR(255) NOT NULL UNIQUE,       -- Nome de usuário
    senha VARCHAR(255) NOT NULL,                -- Senha do usuário
    tipo ENUM('funcionario', 'cliente') NOT NULL  -- Tipo de usuário (funcionário ou cliente)
);

-- Inserção de usuários padrão (exemplo para teste)
INSERT INTO usuarios (usuario, senha, tipo) VALUES 
('funcionario', '123', 'funcionario'),
('cliente', '123', 'cliente');

-- Inserção de funcionários
INSERT INTO funcionarios (nome, cpf, telefone, endereco) 
VALUES 
('Henrique', '123.456.789-01', '47911111111', 'Rua do Henrique, 123'),
('Daniel', '234.567.891-02', '47922222222', 'Rua do Daniel, 456'),
('Nicolas', '345.678.912-03', '47933333333', 'Rua do Nicolas, 789');

-- Inserção de clientes
INSERT INTO clientes (nome, cnpj, telefone, endereco)
VALUES 
('Cliente Bom', '12.345.678/0001-01', '47944444444', 'Rua do Bom, 100'),
('Cliente Chato', '23.456.789/0001-02', '47955555555', 'Rua do Chato, 200'),
('Cliente Ruim', '34.567.891/0001-03', '47966666666', 'Rua do Ruim, 300'),
('Cliente Pilantra', '45.678.912/0001-04', '47977777777', 'Rua do Pilantra, 400');

-- Inserção de fornecedores
INSERT INTO fornecedores (nome, cnpj, telefone, endereco) 
VALUES 
('Fornecedor Válvulas', '56.789.123/0001-05', '119111111111', 'Rua das Válvulas, 100'),
('Fornecedor Conexões', '67.891.234/0001-06', '11922222222', 'Rua das Conexões, 200'),
('Fornecedor Vedações', '78.912.345/0001-07', '11933333333', 'Rua das Vedações, 300'),
('Fornecedor Visores', '89.123.456/0001-08', '11944444444', 'Rua dos Visores, 400');

-- Inserção de transportadoras
INSERT INTO transportadoras (nome, cnpj, telefone, endereco) 
VALUES 
('Transportadora Santa Catarina', '91.234.567/0001-09', '47988888888', 'Rua das Transportadoras, 100'),
('Transportadora Paraná', '13.579.135/0001-10', '49911111111', 'Rua das Transportadoras, 200'),
('Transportadora São Paulo', '24.680.246/0001-11', '11955555555', 'Rua das Transportadoras, 300');

-- Inserção de produtos
INSERT INTO produtos (nome, valor, categoria_id) 
VALUES 
('Vedação 1/2”', 10.00, 1),
('Vedação 1”', 15.00, 1),
('Vedação 1.1/2”', 20.00, 1),
('Vedação 2”', 25.00, 1),
('Vedação 2.1/2”', 30.00, 1),
('Conexão 1/2"', 10.00, 2),
('Conexão 1”', 15.00, 2),
('Conexão 1.1/2"', 20.00, 2),
('Conexão 2”', 25.00, 2),
('Conexão 2.1/2"', 30.00, 2),
('Válvula 1/2"', 10.00, 3),
('Válvula 1”', 15.00, 3),
('Válvula 1.1/2"', 20.00, 3),
('Válvula 2”', 25.00, 3),
('Válvula 2.1/2"', 30.00, 3),
('Visor 1/2"', 10.00, 4),
('Visor 1”', 15.00, 4),
('isor 1.1/2"', 20.00, 4),
('Visor 2”', 25.00, 4),
('Visor 2.1/2"', 30.00, 4);

-- Inserção de pedidos
INSERT INTO pedidos (cliente_nome, produto_nome, valor_unitario, quantidade, valor_total, transportadora_nome)
VALUES 
('Cliente Bom', 'Vedação 1”', 15.00, 5, 75.00, 'Transportadora Santa Catarina'),
('Cliente Chato', 'Válvula 1.1/2"', 20.00, 3, 60.00, 'Transportadora Paraná'),
('Cliente Pilantra', 'Conexão 2”', 25.00, 10, 250.00, 'Transportadora São Paulo'),
('Cliente Bom', 'Válvula 1"', 15.00, 5, 75.00, 'Transportadora Santa Catarina'),
('Cliente Ruim', 'Visor 1/2"', 10.00, 1, 10.00, 'Transportadora Paraná'),
('Cliente Bom', 'Conexão 1”', 15.00, 10, 150.00, 'Transportadora Santa Catarina'),
('Cliente Bom', 'Visor 2”', 25.00, 2, 50.00, 'Transportadora Santa Catarina'),
('Cliente Chato', 'Visor 2.1/2"', 30.00, 3, 90.00, 'Transportadora Paraná'),
('Cliente Ruim', 'Conexão 1/2”', 10.00, 10, 100.00, 'Transportadora Paraná'),
('Cliente Bom', 'Conexão 2”', 25.00, 5, 125.00, 'Transportadora Santa Catarina');



ALTER USER 'seu_usuario'@'localhost' IDENTIFIED WITH mysql_native_password BY 'sua_senha';
FLUSH PRIVILEGES;



-- Consultar todos os pedidos, com detalhes do cliente, produto e transportadora
SELECT 
    p.id AS pedido_id,                      		 	-- Código do pedido
    p.cliente_nome AS cliente,                  	 	-- Nome do cliente
    p.produto_nome AS produto,                  	 	-- Nome do produto
    p.valor_unitario,                           			-- Valor unitário do produto
    p.quantidade,                               			-- Quantidade de produtos no pedido
    p.valor_total,                              			-- Valor total do pedido
    p.transportadora_nome AS transportadora,    	-- Nome da transportadora
    p.data_pedido                               			-- Data do pedido
FROM 
    pedidos p
ORDER BY 
    p.data_pedido DESC;                         		-- Ordenar pelos pedidos mais recentes
