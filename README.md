ЗАДАНИЕ: 
Сделать вертикальный список на рандомное количество элементов (больше 100).
В каждом элементе вертикального списка – горизонтальный список на рандомное количество элементов (больше 10).
Каждая ячейка – квадратик с бордером и скругленными углами (произвольный радиус), отображающий случайное число.
При тапе на квадратик он должен анимировано уменьшаться на 20% (при тапе уменьшаться, при отпускании возвращаться к прежним размерам)
Раз в секунду обновляется одно случайное число во всех горизонтальных списках.

Решение: 
SwiftUI MVVM 
1) LazyVStack - отложенная загрузка представлений, что уменьшает нагрузку на память, так как создаются только видимые элементы.
2) Использование Combine для обновлений данных при помощи Timer.publish
3) Обновление данных вне области видимости экрана в методе updateNumbers класса MainViewModel
4) В NumberView использовано состояние isPressed.

Доп решения(опционально)
1)кеширование ячеек
2)использование Combine для обновления только видимых ячеек

Task:
Make a vertical list for a random number of items (more than 100).
Each element of the vertical list contains a horizontal list with a random number of elements (more than 10).
Each cell is a square with a border and rounded corners (arbitrary radius), displaying a random number.
When tapping on a square, it should animatedly decrease by 20% (decrease when tapping, return to its previous size when released)
Once a second, one random number is updated in all horizontal lists.

Decision:
SwiftUI MVVM
1) LazyVStack - delayed loading of views, which reduces the memory load, since only visible elements are created.
2) Using Combine to update data using Timer.publish
3) Updating data outside the scope of the screen in the update Number s method of the MainViewModel class
4) The IsPressed state is used in the NumberView.

Additional solutions(optional)
1)Cell caching
2)using Combine to update only visible cells


<img width="735" alt="Снимок экрана 2024-03-03 в 19 33 01" src="https://github.com/Croleack/testProjectStartup/assets/121854191/8ad8b9ba-76ce-465e-aded-2a5f406eec8b">
