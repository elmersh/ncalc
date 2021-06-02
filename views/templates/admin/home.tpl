{extends file="inc/theme.tpl"}
{$title = "admin"}
{$active = "admin"}
{$buttons = false}
{$url = '/materias/registrar'}
{$btitle = 'Registrar materia'}
{block name=content}

  <div class="px-4 mt-6 sm:px-6 lg:px-8">
    <h2 class="text-gray-500 text-xs font-medium uppercase tracking-wide">Materias registradas recientemente</h2>
    <ul class="grid grid-cols-1 gap-4 sm:gap-6 sm:grid-cols-2 xl:grid-cols-3 mt-3">

      {foreach $materias as $id => $materia}
        <li class="relative col-span-1 flex shadow-sm rounded-md">
          <div
            class="flex-shrink-0 flex items-center justify-center w-16 bg-pink-600 text-white text-sm font-medium rounded-l-md">
            {$materia->codigo}
          </div>
          <div
            class="flex-1 flex items-center justify-between border-t border-r border-b border-gray-200 bg-white rounded-r-md truncate">
            <div class="flex-1 px-4 py-2 text-sm truncate">
              <a href="/materias/mostrar?id={$materia->id}" class="text-gray-900 font-medium hover:text-gray-600">

                {$materia->nombre}
              </a>
              <p class="text-gray-500">{$materia->horario}</p>
            </div>
            <div x-data="{ isOpen: false }" class="flex-shrink-0 pr-2">
              <button @click=" isOpen = !isOpen " type="button"
                class="w-8 h-8 bg-white inline-flex items-center justify-center text-gray-400 rounded-full hover:text-gray-500 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-purple-500"
                id="pinned-project-options-menu-0" aria-expanded="false" aria-haspopup="true">
                <span class="sr-only">Open options</span>
                <svg class="w-5 h-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor"
                  aria-hidden="true">
                  <path d="M10 6a2 2 0 110-4 2 2 0 010 4zM10 12a2 2 0 110-4 2 2 0 010 4zM10 18a2 2 0 110-4 2 2 0 010 4z" />
                </svg>
              </button>
              <div x-cloak x-show.transition="isOpen" @click.away="isOpen = false"
                class="z-10 mx-3 origin-top-right absolute right-0 top-12 w-48 mt-1 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5 divide-y divide-gray-200 focus:outline-none"
                role="menu" aria-orientation="vertical" aria-labelledby="pinned-project-options-menu-0">
                <div class="py-1" role="none">
                  <a href="/materias/editar?id={$materia->id}"
                    class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 hover:text-gray-900"
                    role="menuitem">Editar</a>
                </div>
                <div class="py-1 relative overflow-hidden" role="none" x-data="{ 'showModal': false }"
                  @keydown.escape="showModal = false" x-cloack>
                  <a @click="showModal = true" href="#"
                    class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 hover:text-gray-900"
                    role="menuitem">Borrar</a>

                  <div x-show="showModal" class="fixed z-10 inset-0 overflow-y-auto" :class="{ '': showModal }"
                    aria-labelledby="dialog-1-title" role="dialog" aria-modal="true">
                    <div class="flex items-end justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">
                      <div class="fixed inset-0 bg-gray-500 bg-opacity-75 transition-opacity" aria-hidden="true"></div>
                      <span class="hidden sm:inline-block sm:align-middle sm:h-screen" aria-hidden="true">&#8203;</span>

                      <div @click.away="showModal = false" @keydown.escape="showModal = false"
                        x-show.transition.origin.top.left.duration.500ms="showModal"
                        class="inline-block align-bottom bg-white rounded-lg text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg sm:w-full">
                        <div class="bg-white px-4 pt-5 pb-4 sm:p-6 sm:pb-4">
                          <div class="sm:flex sm:items-start">
                            <div
                              class="mx-auto flex-shrink-0 flex items-center justify-center h-12 w-12 rounded-full bg-red-100 sm:mx-0 sm:h-10 sm:w-10">
                              <!-- Heroicon name: outline/exclamation -->
                              <svg class="h-6 w-6 text-red-600" xmlns="http://www.w3.org/2000/svg" fill="none"
                                viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" />
                              </svg>
                            </div>
                            <div class="mt-3 text-center sm:mt-0 sm:ml-4 sm:text-left">
                              <h3 class="text-lg leading-6 font-medium text-gray-900" id="dialog-1-title">
                                Borrar materia
                              </h3>
                              <div class="mt-2">
                                <p class="text-sm text-gray-500">
                                  Estás seguro de borrar esta materia?
                                </p>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="bg-gray-50 px-4 py-3 sm:px-6 sm:flex sm:flex-row-reverse">
                          <form method="post" action="/materias">
                            <input type="hidden" name="id" id="id" value="{$materia->id}">
                            <input type="hidden" name="admDelete" id="admDelete" value="1">
                            <button type="submit"
                              class="w-full inline-flex justify-center rounded-md border border-transparent shadow-sm px-4 py-2 bg-red-600 text-base font-medium text-white hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500 sm:ml-3 sm:w-auto sm:text-sm">
                              Borrar
                            </button>
                          </form>
                          <button @click="showModal = false" type="button"
                            class="mt-3 w-full inline-flex justify-center rounded-md border border-gray-300 shadow-sm px-4 py-2 bg-white text-base font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 sm:mt-0 sm:ml-3 sm:w-auto sm:text-sm">
                            Cancelar
                          </button>
                        </div>
                      </div>
                    </div>
                  </div>

                </div>
              </div>
            </div>
          </div>
        </li>
      {/foreach}
    </ul>
  </div>
  <hr class="my-12" />
  <div class="px-4 mt-8 sm:px-6 lg:px-8">
  <h2 class="text-gray-500 text-xs font-medium uppercase tracking-wide">Usuarios registrados recientemente</h2>
  <!-- This example requires Tailwind CSS v2.0+ -->
  <ul class="grid grid-cols-1 gap-6 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4">
  {foreach $usuarios as $id => $usuario}
    
    <li class="col-span-1 flex flex-col text-center bg-white rounded-lg shadow divide-y divide-gray-200 mt-3">
      <div class="flex-1 flex flex-col p-8">
         
             <img class="w-32 h-32 flex-shrink-0 mx-auto bg-black rounded-full" src="{gravatar email=$usuario->email}" />
         
        <h3 class="mt-6 text-gray-900 text-sm font-medium">{$usuario->nombre}</h3>
        <dl class="mt-1 flex-grow flex flex-col justify-between">
          <dt class="sr-only">Rango</dt>
          <dd class="mt-3">
            <span class="px-2 py-1 text-green-800 text-xs font-medium bg-green-100 rounded-full">{$usuario->titulo}</span>
          </dd>
        </dl>
      </div>
      <div>
        <div class="-mt-px flex divide-x divide-gray-200">
          <div class="w-0 flex-1 flex">
            <a href="#" 
              class="relative -mr-px w-0 flex-1 inline-flex items-center justify-center py-4 text-sm text-gray-700 font-medium border border-transparent rounded-bl-lg hover:text-gray-500">
              <!-- Heroicon name: solid/mail -->
              <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24"
                stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                  d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
              </svg>
              <span class="ml-3">Editar</span>
            </a>
          </div>
          <div class="-ml-px w-0 flex-1 flex">
            <a href="#"
              class="relative w-0 flex-1 inline-flex items-center justify-center py-4 text-sm text-gray-700 font-medium border border-transparent rounded-br-lg hover:text-gray-500">
              <!-- Heroicon name: solid/phone -->
              <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24"
                stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                  d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
              </svg>
              <span class="ml-3">Borrar</span>
            </a>
          </div>
        </div>
      </div>
    </li>
  {/foreach}
    <!-- More items... -->
  </ul>
  </div>
{/block}