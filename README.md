# Lab5-G6
FLUJO DE TRABAJO
Turno del Integrante 1:
1. Se baja lo último de main.
2. Crea su rama: git checkout -b feature-parte1.
3. Hace los inserts independientes, los prueba en su MySQL, los guarda, sube su rama a GitHub y hace el Merge (fusión) a main. Ahora main ya tiene datos.
Turno del Integrante 2:
1. Hace un **git pull origin main** para bajarse los inserts que hizo el Integrante 1.
2. Crea su rama: git checkout -b feature-parte2.
3. Escribe los UPDATE, los prueba (ya tiene datos gracias al paso anterior), sube su rama y hace Merge a main.
Y así sucesivamente... hasta llegar al Integrante 5.

COMO SUBIR SU PARTE
1. Abres el archivo: Abres laboratorio5_ventas.sql (puedes abrirlo con el bloc de notas, VS Code o el mismo Workbench para escribir cómodo).
2. Programas y pruebas: Copias tus consultas, las pegas en MySQL Workbench, las corres y ves que boten tus capturas para el informe. Si todo funciona, guardas el archivo .sql.
3. Usas Git (Fuera de MySQL): Abres la terminal de tu compu (Git Bash, la terminal de VS Code) o usas la aplicación visual GitHub Desktop.
Haces el commit y push:
  git add laboratorio5_ventas.sql
  git commit -m "Terminé las tareas 4, 5 y 6 de updates"
  git push origin mi-rama
