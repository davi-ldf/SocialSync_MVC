-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 12/08/2024 às 20:14
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `socialsync`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `postcomments`
--

CREATE TABLE `postcomments` (
  `id` int(11) NOT NULL,
  `id_post` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `body` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `postcomments`
--

INSERT INTO `postcomments` (`id`, `id_post`, `id_user`, `created_at`, `body`) VALUES
(3, 3, 1, '2024-08-12 14:58:58', 'Comentar??? Show!'),
(4, 3, 4, '2024-08-12 15:01:29', 'Muito bom!');

-- --------------------------------------------------------

--
-- Estrutura para tabela `postlikes`
--

CREATE TABLE `postlikes` (
  `id` int(11) NOT NULL,
  `id_post` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `postlikes`
--

INSERT INTO `postlikes` (`id`, `id_post`, `id_user`, `created_at`) VALUES
(8, 1, 1, '2024-08-12 14:44:25'),
(11, 3, 1, '2024-08-12 14:58:51'),
(12, 2, 1, '2024-08-12 14:59:04'),
(13, 3, 4, '2024-08-12 15:01:24'),
(14, 6, 4, '2024-08-12 15:01:43'),
(15, 2, 4, '2024-08-12 15:02:14');

-- --------------------------------------------------------

--
-- Estrutura para tabela `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `body` text NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `posts`
--

INSERT INTO `posts` (`id`, `type`, `created_at`, `body`, `id_user`) VALUES
(1, 'text', '2024-07-23 23:29:40', 'Olá, visitante! Seja bem-vindo ao SocialSync. \r\nEsta é uma plataforma desenvolvida aos moldes do famoso Facebook.\r\n\r\n\r\n\r\n\r\nPor aqui você pode interagir com publicações, personalizar seu perfil, seguir outros perfis e muito mais.\r\n\r\n\r\nNão se esqueça de conferir a documentação completa no repositório do GitHub, onde eu informo mais detalhes sobre o funcionamento deste projeto!', 1),
(2, 'photo', '2024-08-12 14:34:58', 'a069ab800a1ac529394a78204ede86c6.jpg', 2),
(3, 'text', '2024-08-12 14:35:52', 'Você sabia que no SocialSync você pode encontrar seus amigos e os seguir? Além disso, pode curtir e comentar em publicações como esta!', 2),
(6, 'photo', '2024-08-12 15:01:38', '7eb1a6862a62410c81800690963502b0.jpg', 4),
(7, 'text', '2024-08-12 15:14:05', 'Olá, visitante! Seja bem-vindo ao SocialSync. \r\nEsta é uma plataforma desenvolvida aos moldes do famoso Facebook.\r\n\r\n\r\n\r\n\r\nPor aqui você pode interagir com publicações, personalizar seu perfil, seguir outros perfis e muito mais.\r\n\r\n\r\nNão se esqueça de conferir a documentação completa no repositório do GitHub, onde eu informo mais detalhes sobre o funcionamento deste projeto!', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `userrelations`
--

CREATE TABLE `userrelations` (
  `id` int(11) NOT NULL,
  `user_from` int(11) NOT NULL,
  `user_to` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `userrelations`
--

INSERT INTO `userrelations` (`id`, `user_from`, `user_to`) VALUES
(6, 1, 2),
(7, 4, 1),
(8, 4, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `birthdate` date NOT NULL,
  `city` varchar(100) NOT NULL,
  `work` varchar(100) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `cover` varchar(100) NOT NULL,
  `token` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `name`, `birthdate`, `city`, `work`, `avatar`, `cover`, `token`) VALUES
(1, 'user@teste.com', '$2y$10$nR/zBw8VmAmWASjHUMmjHOLjeBlFsoES.cCM63fF50KFFHAcZIwvO', 'Davi Lisboa', '2000-09-20', 'Fortaleza', 'SocialSync', 'a5ea11052c775f491a9da336cebdd83e.jpg', '54a0c11bb4fa7159cb58111b301f30a8.jpg', 'e31c10e28a50394aaec6ff37f6ff5ed2'),
(2, 'user2@teste.com', '$2y$10$s8CqTF0lkctO0S30O1uJyepw94vWj9LQ3./PqWbDcy5HzggVhG9eC', 'Alessandro', '2003-03-12', '', '', '95a04353ed07b7ff49a7a41937c11de4.jpg', 'aabef165c091110e362743d600094dc6.jpg', '2f1795f409acc25d4b5df4f4bbfa20b2'),
(4, 'user3@teste.com', '$2y$10$TaZ6SRvsYGV01sGUvMcYc.LXGpwYMEu6Zvgl.k6.ZbyZDZ0U5xdnu', 'Fulano de Tal', '1970-07-16', '', '', 'f4ac2bf4ffa06de3f24940a4ad475fb2.jpg', 'f9662ad56eb2603a86b4826e5cc5736f.jpg', '4dacca89670dd5b1a51bd001a37f6972');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `postcomments`
--
ALTER TABLE `postcomments`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `postlikes`
--
ALTER TABLE `postlikes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `userrelations`
--
ALTER TABLE `userrelations`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `postcomments`
--
ALTER TABLE `postcomments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `postlikes`
--
ALTER TABLE `postlikes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `userrelations`
--
ALTER TABLE `userrelations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
