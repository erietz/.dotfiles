#!/usr/bin/env python

import click

@click.command()
@click.option('--scheduler', '--s', default='slurm', type=click.Choice(['pbs', 'slurm']),
                prompt=True, help='Scheduler being used')
@click.option('--walltime', '--w', default='00:30:00', help='e.g. 15 min = 00:15:00')
@click.option('--email', '--e', is_flag=True, help='Send an email on job status')
@click.argument('filename')

def run(filename, walltime, scheduler, email):
    filename = filename.split('.')[0]
    if scheduler == 'slurm':
        with open(f'{filename}.slurm', 'w') as f:
            f.write('#!/usr/bin/env zsh\n')
            f.write('#SBATCH --nodes=1\n')
            f.write('#SBATCH --ntasks-per-node=16\n')
            f.write('#SBATCH --mem=12gb\n')
            f.write(f'#SBATCH --time=0-{walltime}\n')
            f.write(f'#SBATCH --job-name={filename}\n')
            if email:
                f.write('#SBATCH --mail-user=ewrietz@iu.edu\n')
                f.write('#SBATCH --mail-type=FAIL,BEGIN,END\n')
                f.write('\n')
            #f.write('cd $SLURM_SUBMIT_DIR\n')
            f.write(f'g16 < {filename}.com > {filename}.log\n')
    elif scheduler == 'pbs':
        with open(f'{filename}.pbs', 'w') as f:
            f.write('#!/bin/zsh\n')
            f.write('#PBS -l nodes=1:ppn=16   # ppn is processors per node.\n')
            #f.write('#PBS -l vmem=10gb\n')
            f.write(f'#PBS -l walltime=0:{walltime}\n')
            f.write(f'#PBS -N {filename}\n')
            f.write('#PBS -j oe\n')
            if email:
                f.write('#PBS -M ewrietz@iu.edu\n')
                f.write('#PBS -m abe\n')
            f.write('\n')
            #f.write('cd $PBS_O_WORKDIR\n')
            f.write(f'g16 < {filename}.com > {filename}.log\n')
    else:
            f.write('This option should not be possible')

if __name__ == '__main__':
        run()
