{extends file="inc/theme.tpl"}
{$title = "trabajos"}
{block name=content}
    <h1>Lista de trabajos</h1>
    {foreach $materias as $id => $materia}
        <div>{$materia.id} - {$materia.nombre} - {$materia.codigo}</div>
    {/foreach}
{/block}