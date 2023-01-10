import express from 'express'
import csrf from 'csurf'
import cookieParser from 'cookie-parser'
import propiedadesRoutes from './routes/propiedadesRoutes.js'
import usuarioRoutes from './routes/usuarioRoutes.js'

import db from './config/db.js'

// Crear la app
const app = express()

// Habilitar lectura de datos de formularios
app.use( express.urlencoded({extended: true}) )

// Habilitar Cookie Parser
app.use( cookieParser() )

// Habilitar CSRF
app.use( csrf({cookie: true}) )

// Conexión a la base de datos
try {
    await db.authenticate();
    db.sync()
    console.log('Conexión Correcta a la Base de datos')
} catch (error) {
    console.log(error)
}

// Habilitar Pug
app.set('view engine', 'pug')
app.set('views', './views')

// Carpeta Pública
app.use( express.static('public') )

// Routing
app.use('/auth', usuarioRoutes)
app.use('/', propiedadesRoutes)





// Definir un puerto y arrancar el proyecto
const port = process.env.PORT || 3000;
app.listen(port, () => {
    console.log(`El Servidor esta funcionando en el puerto ${port}`)
});