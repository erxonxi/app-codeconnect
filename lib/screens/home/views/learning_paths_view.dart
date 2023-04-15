import 'package:flutter/material.dart';

import '../../../models/learning_path.dart';
import '../../learning_path_detail/learning_path_detail_screen.dart';
import '../widgets/learning_path_card.dart';
import '../widgets/search_input.dart';

class LearningPathsView extends StatefulWidget {
  const LearningPathsView({
    super.key,
  });

  @override
  State<LearningPathsView> createState() => _LearningPathsViewState();
}

class _LearningPathsViewState extends State<LearningPathsView> {
  int _pathSelected = 0;

  final List<LearningPath> _paths = [
    LearningPath(
      id: "1",
      title: "React Developer Roadmap",
      description:
          "Aprende a desarrollar aplicaciones web modernas utilizando React.",
      skillNodes: [
        SkillNode(
          id: "1",
          title: "Fundamentos de JavaScript",
          isCompleted: true,
          description:
              "Aprende los fundamentos del lenguaje de programación JavaScript.",
          children: [
            SkillNode(
              id: "1.1",
              title: "Variables y Tipos de Datos",
              description:
                  "Entiende las variables y los tipos de datos en JavaScript.",
              children: [],
            ),
            SkillNode(
              id: "1.2",
              title: "Funciones",
              description:
                  "Aprende cómo crear y utilizar funciones en JavaScript.",
              children: [],
            ),
            SkillNode(
              id: "1.3",
              title: "Classes",
              description: "Aprende a utilizar las clases en JavaScript.",
              children: [],
            ),
          ],
        ),
        SkillNode(
          id: "2",
          title: "Fundamentos de React",
          description:
              "Aprende los conceptos básicos de React y cómo utilizarlo para crear aplicaciones web.",
          children: [
            SkillNode(
              id: "2.1",
              title: "Componentes",
              description:
                  "Aprende sobre los componentes en React y cómo crearlos.",
              children: [],
            ),
            SkillNode(
              id: "2.2",
              title: "Estado y Propiedades",
              description:
                  "Entiende cómo utilizar el estado y las propiedades en los componentes de React.",
              children: [],
            ),
            SkillNode(
              id: "2.3",
              title: "Hooks",
              description:
                  "Aprende a utilizar los Hooks de React para manejar el estado de los componentes.",
              children: [],
            ),
            SkillNode(
              id: "2.4",
              title: "Context API",
              description:
                  "Aprende a utilizar la Context API de React para manejar el estado de la aplicación.",
              children: [],
            ),
            SkillNode(
              id: "2.5",
              title: "Rutas",
              description:
                  "Aprende a utilizar React Router para manejar las rutas de la aplicación.",
              children: [],
            ),
            SkillNode(
              id: "2.6",
              title: "Formularios",
              description:
                  "Aprende a crear formularios en React y cómo manejar su estado.",
              children: [],
            ),
            SkillNode(
              id: "2.7",
              title: "Estilos",
              description:
                  "Aprende a utilizar estilos en React y cómo manejarlos.",
              children: [],
            ),
          ],
        ),
        SkillNode(
          id: "3",
          title: "Testing",
          description:
              "Aprende a realizar pruebas unitarias y de integración en React.",
          children: [
            SkillNode(
              id: "3.1",
              title: "Jest",
              description:
                  "Aprende a utilizar Jest para realizar pruebas unitarias en React.",
              children: [],
            ),
            SkillNode(
              id: "3.2",
              title: "Testing Library",
              description:
                  "Aprende a utilizar Testing Library para realizar pruebas de integración en React.",
              children: [],
            ),
            SkillNode(
              id: "3.3",
              title: "Cypress",
              description:
                  "Aprende a utilizar Cypress para realizar pruebas de integración en React.",
              children: [],
            ),
            SkillNode(
              id: "3.4",
              title: "Mocking",
              description:
                  "Aprende a utilizar Mocking para realizar pruebas unitarias en React.",
              children: [],
            ),
            SkillNode(
              id: "3.5",
              title: "Test Driven Development",
              description:
                  "Aprende a utilizar TDD para desarrollar aplicaciones en React.",
              children: [],
            ),
          ],
        ),
        SkillNode(
          id: "4",
          title: "Despliegue",
          description:
              "Aprende a desplegar aplicaciones web en React utilizando diferentes servicios.",
          children: [
            SkillNode(
              id: "4.1",
              title: "Netlify",
              description:
                  "Aprende a desplegar aplicaciones web en React utilizando Netlify.",
              children: [],
            ),
            SkillNode(
              id: "4.2",
              title: "Vercel",
              description:
                  "Aprende a desplegar aplicaciones web en React utilizando Vercel.",
              children: [],
            ),
            SkillNode(
              id: "4.3",
              title: "Heroku",
              description:
                  "Aprende a desplegar aplicaciones web en React utilizando Heroku.",
              children: [],
            ),
            SkillNode(
              id: "4.4",
              title: "Firebase",
              description:
                  "Aprende a desplegar aplicaciones web en React utilizando Firebase.",
              children: [],
            ),
          ],
        ),
      ],
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 80),
          child: ListView.builder(
            itemCount: _paths.length,
            itemBuilder: (context, index) {
              final path = _paths[index];
              return LearningPathCard(
                  isActive: index == _pathSelected,
                  path: path,
                  press: () {
                    setState(() {
                      _pathSelected = index;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            LearningPathDetailScreen(path: path),
                      ),
                    );
                  });
            },
          ),
        ),
        const Positioned(
          top: 20,
          left: 0,
          right: 0,
          child: SearchInput(),
        ),
      ],
    );
  }
}
