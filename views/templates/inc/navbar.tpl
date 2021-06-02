    <nav class="mt-5 flex-1 px-2 space-y-1" aria-label="Sidebar">
        {if in()}
      <!-- Current: "bg-green-800 text-white", Default: "hover:bg-green-600 hover:bg-opacity-75" -->
      <a href="/" class="{if isset($active) and $active == 'dashboard' }bg-green-800 text-white{else}hover:bg-green-600 hover:bg-opacity-75{/if} group flex items-center px-2 py-2 text-sm font-medium rounded-md">
        <!-- Heroicon name: outline/home -->
        <svg class="mr-3 h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6" />
        </svg>
        Dashboard
      </a>

      <a href="/materias" class="{if isset($active) and $active == 'materias' }bg-green-800 text-white{else}hover:bg-green-600 hover:bg-opacity-75{/if} group flex items-center px-2 py-2 text-sm font-medium rounded-md">

        <svg class="mr-3 h-6 w-6 text-green-300" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253" />
        </svg>
        Materias

        <!-- Current: "bg-green-600", Default: "bg-green-800" -->
{*        <span class="bg-green-800 ml-auto inline-block py-0.5 px-3 text-xs font-medium rounded-full">*}
{*          3*}
{*        </span>*}
      </a>
        {else}
        <a href="/crear-cuenta" class="{if isset($active) and $active == 'crear-cuenta' }bg-green-800 text-white{else}hover:bg-green-600 hover:bg-opacity-75{/if} group flex items-center px-2 py-2 text-sm font-medium rounded-md">

        <svg xmlns="http://www.w3.org/2000/svg" class="mr-3 h-6 w-6 text-green-300" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z" />
              </svg>
                <span>Crear cuenta</span>
        </a>
        {/if}
        {if in() and is_admin()}
          <a href="/admin"
            class="{if isset($active) and $active == 'crear-cuenta' }bg-green-800 text-white{else}hover:bg-green-600 hover:bg-opacity-75{/if} group flex items-center px-2 py-2 text-sm font-medium rounded-md">

            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24"
              stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z" />
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
            </svg>
            <span>Admin</span>
          </a>
        {/if}
    </nav>