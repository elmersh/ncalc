{extends file="inc/theme.tpl"}
{$title = "home"}
{$active = "home"}

{block name=content}

      <!-- Hero card -->
      <div class="relative h-full">
        <div class="absolute inset-x-0 bottom-0 h-full"></div>
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
          <div class="relative shadow-xl sm:rounded-2xl sm:overflow-hidden">
            <div class="absolute inset-0">
              <img class="h-full w-full object-cover"
                src="https://images.unsplash.com/photo-1578364249730-0c4ee16426fa?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1834&q=80"
                alt="People working on laptops">
              <div class="absolute inset-0 bg-green-700 backdrop-filter backdrop-blur-lg" style="mix-blend-mode: multiply;"></div>
            </div>
            <div class="relative px-4 py-16 sm:px-6 sm:py-24 lg:py-32 lg:px-8">
              <h1 class="text-center text-4xl font-extrabold tracking-tight sm:text-5xl lg:text-6xl">
                <span class="block text-white">Bienvenido a [nombre acá]</span>
                <span class="block text-green-200">Un portal para tener tus materias en orden</span>
              </h1>
              <p class="mt-6 max-w-lg mx-auto text-center text-xl text-green-200 sm:max-w-3xl">
                Elige ingresar si ya tienes una cuenta, o registrarte si aún no.
              </p>
              <div class="mt-10 max-w-sm mx-auto sm:max-w-none sm:flex sm:justify-center">
                <div class="space-y-4 sm:space-y-0 sm:mx-auto sm:inline-grid sm:grid-cols-2 sm:gap-5">
                  <a href="/ingresar"
                    class="flex items-center justify-center px-4 py-3 border border-transparent text-base font-medium rounded-md shadow-sm text-green-700 bg-white hover:bg-green-50 sm:px-8">
                    Ingresar
                  </a>
                  <a href="/crear-cuenta"
                    class="flex items-center justify-center px-4 py-3 border border-transparent text-base font-medium rounded-md shadow-sm text-white bg-green-500 bg-opacity-60 hover:bg-opacity-70 sm:px-8">
                    Registrar cuenta
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

{/block}