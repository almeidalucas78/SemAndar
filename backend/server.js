import app from './app.js';
import 'dotenv/config';

const PORT = process.env.PORT || 3001;

app.get('/', (req, res) => {
    res.send('🚀 Servidor SemAndar rodando com sucesso!');
});

app.listen(PORT, () => {
    console.log(`✅ Servidor online na porta ${PORT}`);
});