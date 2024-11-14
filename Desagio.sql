-- QUESTÃO 1:

SELECT 
	tb_curso.nome AS curso,
	tb_turma.numero AS turma,
	tb_turma.inicio
FROM tb_turma
INNER JOIN tb_curso
ON tb_turma.curso_id = tb_curso.id


-- QUESTÃO 2:

SELECT
	tb_curso.nome AS curso,
	tb_turma.numero AS turma,
	tb_aluno.nome AS aluno,
	tb_aluno.cpf
FROM tb_matricula
INNER JOIN tb_aluno
ON tb_matricula.aluno_id = tb_aluno.cpf
INNER JOIN tb_turma
ON tb_matricula.turma_id = tb_turma.id
INNER JOIN tb_curso
ON tb_turma.curso_id = tb_curso.id

-- QUESTÂO 3: 

SELECT
	tb_avaliacao.data,
	tb_avaliacao.nota,
	tb_aluno.nome,
	tb_resultado.nota_obtida,
	round((nota_obtida * 100 / nota), 2) AS porcentagem
FROM tb_resultado
INNER JOIN tb_aluno
ON tb_resultado.aluno_id = tb_aluno.cpf
INNER JOIN tb_avaliacao
ON tb_resultado.avaliacao_id = tb_avaliacao.id
ORDER BY data DESC, nome ASC


-- QUESTÃO 4

SELECT 
	tb_aluno.nome,
	SUM(nota_obtida) AS total
FROM tb_resultado
INNER JOIN tb_avaliacao
ON tb_resultado.avaliacao_id = tb_avaliacao.id
INNER JOIN tb_aluno
ON tb_resultado.aluno_id = tb_aluno.cpf
INNER JOIN tb_turma
ON tb_avaliacao.turma_id = tb_turma.id
WHERE tb_turma.numero = 10
GROUP BY nome
