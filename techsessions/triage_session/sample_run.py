import yaml
import shutil
import os
import logging

from sqlalchemy.engine.url import URL
from sqlalchemy.event import listens_for
from sqlalchemy.pool import Pool

from triage.util.db import create_engine
from triage.experiments import MultiCoreExperiment
# you can change the above to SingleCoreExperiment if you are only using 1 core


def run_triage():

  # name of the directory where you're putting this scipt and the other files
  user_path = '/class/rghani/techsession/'


  # add logging to a file (it will also go to stdout via triage logging config)
  log_filename = os.path.join(user_path, 'triage.log')
  logger = logging.getLogger('')
  hdlr = logging.FileHandler(log_filename)
  hdlr.setLevel(15)   # verbose level
  hdlr.setFormatter(logging.Formatter('%(name)-30s  %(asctime)s %(levelname)10s %(process)6d  %(filename)-24s  %(lineno)4d: %(message)s', '%d/%m/%Y %I:%M:%S %p'))
  logger.addHandler(hdlr)

  # creating database engine
  with open('database.yaml', 'r') as dbf:
       dbconfig = yaml.safe_load(dbf)
 
  print(dbconfig)
  db_url = URL(
              'postgres',
              host=dbconfig['host'],
              username=dbconfig['user'],
              database=dbconfig['db'],
              password=dbconfig['pass'],
              port=dbconfig['port'],
          )

  db_engine = create_engine(db_url)

  triage_output_path = os.path.join(user_path, 'triage_output')
  os.makedirs(triage_output_path, exist_ok=True)

  # loading config file
  with open('config.yaml', 'r') as fin:
       config = yaml.safe_load(fin)

  # creating experiment object
  # parameters below are important - you'll need to modify them over the semester for your project
  experiment = MultiCoreExperiment(
      config = config,
      db_engine = db_engine,
      project_path = triage_output_path,
      n_processes=2,
      n_bigtrain_processes=1,
      n_db_processes=2,
      replace=True,
      save_predictions=False
      )

  # experiment.validate()
  experiment.run()


if __name__ == '__main__':
  run_triage()
